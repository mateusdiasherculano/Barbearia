import 'package:barbearia/app/features/log_in/infra/datasources/login_datasource.dart';
import 'package:barbearia/app/models/user_profile_model.dart';
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
      if (e.code == 'user-not-found') {
        throw Exception(
            'Usuário não encontrado. Por favor, verifique o email fornecido.');
      } else if (e.code == 'invalid-email') {
        throw Exception(
            'Email inválido. Por favor, verifique o formato do email');
      } else if (e.code == 'wrong-password') {
        throw Exception('Senha incorreta. Por favor, tente novamente.');
      } else {
        throw Exception('Erro de autenticação: ${e.message}');
      }
    } catch (e) {
      throw Exception('Erro ao fazer login: $e');
    }
  }
}
