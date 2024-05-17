import 'package:barbearia/app/models/user_profile_model.dart';

abstract class RegisterPersonalRepository {
  Future<RegisterPersonalResponse> registerPersonal(
      String? name, String? email, String? password, String? phone);
}
