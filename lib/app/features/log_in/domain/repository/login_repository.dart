import 'package:barbearia/app/models/user_profile_model.dart';

import '../entity/reset_password_response.dart';

abstract class LoginRepository {
  Future<UserProfileModel> login(String? email, String? password);
  Future<ResetPasswordResponse> resetPassword(String? email);
}
