// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NotesController on _NotesControllerBase, Store {
  late final _$notesAtom =
      Atom(name: '_NotesControllerBase.notes', context: context);

  @override
  ObservableList<NoteModel> get notes {
    _$notesAtom.reportRead();
    return super.notes;
  }

  @override
  set notes(ObservableList<NoteModel> value) {
    _$notesAtom.reportWrite(value, super.notes, () {
      super.notes = value;
    });
  }

  late final _$saveNoteAsyncAction =
      AsyncAction('_NotesControllerBase.saveNote', context: context);

  @override
  Future<void> saveNote(NoteModel note) {
    return _$saveNoteAsyncAction.run(() => super.saveNote(note));
  }

  late final _$deleteNoteAsyncAction =
      AsyncAction('_NotesControllerBase.deleteNote', context: context);

  @override
  Future<void> deleteNote(String id) {
    return _$deleteNoteAsyncAction.run(() => super.deleteNote(id));
  }

  late final _$editNoteAsyncAction =
      AsyncAction('_NotesControllerBase.editNote', context: context);

  @override
  Future<void> editNote(int index, NoteModel updatedNote) {
    return _$editNoteAsyncAction.run(() => super.editNote(index, updatedNote));
  }

  @override
  String toString() {
    return '''
notes: ${notes}
    ''';
  }
}
