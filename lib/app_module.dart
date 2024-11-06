import 'package:flutter_modular/flutter_modular.dart';
import 'pages/home_page.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    // i.addSingleton(CounterStore.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => HomePage());
  }
}
