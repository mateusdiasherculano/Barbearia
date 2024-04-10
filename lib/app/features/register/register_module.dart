import 'package:barbearia/app/features/register/presenter/register_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegisterModule extends Module {
  void binds(i) {}

  void routes(r) {
    r.child('/', child: (context) => const RegisterPage());
  }
}
