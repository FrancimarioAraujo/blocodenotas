import 'package:blocodenotas/models/note_model.dart';
import 'package:hive/hive.dart';
import 'package:mobx/mobx.dart';
part 'notes_controller.g.dart';

class NotesController = _NotesControllerBase with _$NotesController;

abstract class _NotesControllerBase with Store {
  late Box<NoteModel> _notesBox;
  @observable
  ObservableList<NoteModel> notes = ObservableList<NoteModel>();

  Future<void> init() async {
    _notesBox = await Hive.openBox<NoteModel>('notesBox');
    _loadNotes();
  }

  void _loadNotes() {
    notes.clear();
    notes.addAll(_notesBox.values.toList());
  }

  @action
  Future<void> saveNote(NoteModel note) async {
    await _notesBox.put(note.id, note);
    notes.add(note);
  }

  @action
  Future<void> deleteNote(String id) async {
    await _notesBox.delete(id);
    notes.removeWhere((note) => note.id == id);
  }

  @action
  Future<void> editNote(int index, NoteModel updatedNote) async {
    await _notesBox.putAt(index, updatedNote);
    notes[index] = updatedNote;
  }
}
