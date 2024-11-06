import 'package:blocodenotas/app_colors.dart';
import 'package:blocodenotas/components/note_card.dart';
import 'package:blocodenotas/models/note_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
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
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
