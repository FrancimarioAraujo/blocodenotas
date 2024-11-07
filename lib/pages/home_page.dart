import 'package:blocodenotas/app_colors.dart';
import 'package:blocodenotas/components/note_card.dart';
import 'package:blocodenotas/controllers/notes_controller.dart';
import 'package:blocodenotas/models/note_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  NotesController notesController = Modular.get<NotesController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloco de Notas'),
      ),
      body: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) {
            return NoteCard(
                note: NoteModel(title: "Teste", content: "Teste"),
                onDelete: () {},
                onEdit: () {});
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
