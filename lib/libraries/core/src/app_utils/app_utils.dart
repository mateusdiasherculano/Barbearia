import 'package:firebase_auth/firebase_auth.dart';

class AppUtils {
  AppUtils._();

  /// Checks if string is phone number.
  static bool isPhoneNumber(String s) {
    if (s.length > 16 || s.length < 9) return false;
    return hasMatch(s, r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$');
  }

  static bool hasMatch(String? value, String pattern) {
    return (value == null) ? false : RegExp(pattern).hasMatch(value);
  }

  /// Checks if string is email.
  static bool isEmail(String s) => hasMatch(s,
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  static String? getMessage(FirebaseAuthException error) {
    switch (error.code) {
      case 'user-not-found':
        return 'Usuário não encontrado. Por favor, verifique o email fornecido.';
      case 'invalid-credential':
        return 'E-mail ou Senha inválidos. Por favor, verifique seus dados.';
      case 'invalid-email':
        return 'Email inválido. Por favor, verifique o formato do email.';
      case 'wrong-password':
        return 'Senha incorreta. Por favor, tente novamente.';
      default:
        return 'Ocorreu um erro: ${error.message}';
    }
  }
}
