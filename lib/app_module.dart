import 'package:barbearia/app/features/barber_dashboard/barber_dashboard_module.dart';
import 'package:barbearia/app/features/log_in/log_in_module.dart';
import 'package:barbearia/app/features/register/register_module.dart';
import 'package:barbearia/app/features/welcome/welcome_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  void binds(i) {}

  void routes(r) {
    r.module('/welcome', module: WelcomeModule());
    r.module('/login', module: LoginModule());
    r.module('/register', module: RegisterModule());
    r.module('/BarberDashboard', module: BarberDashboardModule());
  }
}
