import 'package:barbearia/app/models/user_profile_model.dart';

abstract class LoginDatasource{
  Future<UserProfileModel> login(String? email, String? password);
}