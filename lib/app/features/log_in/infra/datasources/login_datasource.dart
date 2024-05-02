import 'package:barbearia/app/models/user_profile_model.dart';

import '../../domain/entity/reset_password_response.dart';

abstract class LoginDatasource {
  Future<UserProfileModel> login(String? email, String? password);
  Future<ResetPasswordResponse> resetPassword(String? email);
}
