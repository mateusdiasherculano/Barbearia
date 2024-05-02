import 'package:flutter_triple/flutter_triple.dart';

import '../domain/entity/reset_password_response.dart';
import '../domain/user_cases/forgot_password_usecase.dart';

class ForgotPasswordStore extends Store<ResetPasswordResponse> {
  final ForgotPasswordUseCase _execute;

  ForgotPasswordStore(this._execute) : super(ResetPasswordResponse());

  Future<void> resetPassword(String? email) async {
    return execute(() => _execute.call(email));
  }
}
