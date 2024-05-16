import 'package:barbearia/app/features/register_upload/presenter/register_upload_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegisterUploadModule extends Module {
  void binds(i) {}

  void routes(r) {
    r.child('/', child: (context) => const RegisterUploadPage());
  }
}
