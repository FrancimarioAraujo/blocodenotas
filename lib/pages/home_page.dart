import 'package:blocodenotas/app_colors.dart';
import 'package:blocodenotas/components/note_card.dart';
import 'package:blocodenotas/controllers/notes_controller.dart';
import 'package:blocodenotas/db/db_config_util.dart';
import 'package:blocodenotas/models/note_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  NotesController notesController = Modular.get<NotesController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DbConfigUtil().start().then((value) {
      notesController.init();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloco de Notas'),
      ),
      body: Observer(builder: (context) {
        if (notesController.notes.isEmpty) {
          return const Center(
              child: Text(
            "Não há nenhuma nota",
            style: TextStyle(fontSize: 20),
          ));
        }
        return ListView.builder(
            itemCount: notesController.notes.length,
            itemBuilder: (context, index) {
              return NoteCard(
                note: notesController.notes[index],
                onEdit: () {},
              );
            });
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: () {
          Modular.to.pushNamed("/edit");
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
