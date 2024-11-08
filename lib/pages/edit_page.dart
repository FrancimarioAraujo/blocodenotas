import 'package:blocodenotas/components/confirm_alert_dialog.dart';
import 'package:blocodenotas/controllers/notes_controller.dart';
import 'package:blocodenotas/models/note_model.dart';
import 'package:blocodenotas/uuid/uuid_generate_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  NotesController notesController = Modular.get<NotesController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (notesController.noteSelected != null) {
      titleController.text = notesController.noteSelected!.title;
      contentController.text = notesController.noteSelected!.content;
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return PopScope(
        canPop: notesController.noNotesSelected,
        onPopInvoked: (value) async {
          notesController.setNoteSelected(null);
        },
        child: Scaffold(
          appBar: AppBar(
            title: TextField(
              controller: titleController,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                hintText: 'Sem Titulo',
                hintStyle: TextStyle(color: Colors.white),
                border: InputBorder.none,
              ),
              style: const TextStyle(color: Colors.white),
              onChanged: (value) async {
                await autoSave();
              },
            ),
            actions: const [
              // TextButton(
              //   onPressed: () async {},
              //   child: const Text(
              //     "Salvar",
              //     style: TextStyle(color: Colors.white, fontSize: 16),
              //   ),
              // ),
            ],
          ),
          body: Container(
            padding: const EdgeInsets.all(16.0),
            width: double.infinity,
            height: double.infinity,
            child: TextField(
              controller: contentController,
              maxLines: null,
              keyboardType: TextInputType.multiline,
              decoration: const InputDecoration(
                  hintText: 'Digite sua nota aqui...',
                  border: InputBorder.none),
              onChanged: (value) async {
                await autoSave();
              },
            ),
          ),
        ),
      );
    });
  }

  Future<void> autoSave() async {
    if (notesController.noteSelected != null) {
      await notesController
          .editNote(NoteModel(
              title: titleController.text.isEmpty
                  ? "Sem Titulo"
                  : titleController.text,
              content: contentController.text,
              id: notesController.noteSelected!.id))
          .then((value) {});
    } else {
      NoteModel newNote = NoteModel(
          title: titleController.text.isEmpty
              ? "Sem Titulo"
              : titleController.text,
          content: contentController.text,
          id: UuidGenerateUtil().generateId());
      await notesController.saveNote(newNote).then((value) {
        notesController.setNoteSelected(newNote);
      });
    }
  }
}
