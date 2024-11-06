import 'package:blocodenotas/models/note_model.dart';
import 'package:hive/hive.dart';
import 'package:mobx/mobx.dart';
part 'notes_controller.g.dart';

class NotesController = _NotesControllerBase with _$NotesController;

abstract class _NotesControllerBase with Store {
  late Box<NoteModel> _notesBox;
  @observable
  ObservableList<NoteModel> notes = ObservableList<NoteModel>();

  Future<void> _init() async {
    _notesBox = await Hive.openBox<NoteModel>('notesBox');
    _loadNotes();
  }

  void _loadNotes() {
    final allNotes = _notesBox.values.toList();
    notes.clear();
    notes.addAll(allNotes);
  }

  @action
  Future<void> addNote(NoteModel note) async {
    await _notesBox.add(note);
    notes.add(note);
  }

  @action
  Future<void> deleteNote(int index) async {
    await _notesBox.deleteAt(index);
    notes.removeAt(index);
  }

  @action
  Future<void> editNote(int index, NoteModel updatedNote) async {
    await _notesBox.putAt(index, updatedNote);
    notes[index] = updatedNote;
  }
}
