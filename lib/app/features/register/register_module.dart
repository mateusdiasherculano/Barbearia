import 'package:barbearia/app/features/register/presenter/register_base_page.dart';
import 'package:barbearia/app/features/register/presenter/register_personal_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegisterModule extends Module {
  void binds(i) {
    i.addLazySingleton(RegisterPersonalController.new);
  }

  void routes(r) {
    r.child('/', child: (context) => const RegisterPage());
  }
}
