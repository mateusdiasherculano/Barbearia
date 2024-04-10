import 'package:barbearia/app/features/log_in/presenter/log_in_page.dart';
import 'package:barbearia/app/features/log_in/presenter/login_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginModule extends Module {
  void binds(i) {
    i.addSingleton(LoginController.new);
  }

  void routes(r) {
    r.child('/', child: (context) => const LoginPage());
  }
}
