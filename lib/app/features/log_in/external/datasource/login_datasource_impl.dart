import 'package:barbearia/app/features/log_in/infra/datasources/login_datasource.dart';
import 'package:barbearia/app/models/user_profile_model.dart';
import 'package:barbearia/libraries/core/src/app_utils/app_utils.dart';
import 'package:barbearia/libraries/core/src/error/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginDatasourceImpl implements LoginDatasource {
  final FirebaseAuth firebaseAuth = Modular.get();

  @override
  Future<UserProfileModel> login(String? email, String? password) async {
    try {
      UserCredential response = await firebaseAuth.signInWithEmailAndPassword(
        email: email!,
        password: password!,
      );

      return UserProfileModel.fromUserCredential(response);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'network-request-failed') {
        throw 'Verifique sua rede.';
      } else {
        throw Failure(
            label: 'Datasource-signIn',
            exception: e,
            message: AppUtils.getMessage(e) ?? e.message);
      }
    } catch (e) {
      throw Exception('Erro ao fazer login: $e');
    }
  }
}
