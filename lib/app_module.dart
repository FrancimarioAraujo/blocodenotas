import 'package:blocodenotas/controllers/notes_controller.dart';
import 'package:blocodenotas/pages/edit_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'pages/home_page.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addSingleton(NotesController.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const HomePage());
    r.child('/edit', child: (context) => const EditPage());
  }
}
