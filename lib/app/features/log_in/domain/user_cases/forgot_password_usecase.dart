import 'package:barbearia/app/features/log_in/domain/entity/reset_password_response.dart';
import 'package:barbearia/app/features/log_in/domain/repository/login_repository.dart';

abstract class IExecute {
  Future<ResetPasswordResponse> call(String? email);
}

class ForgotPasswordUseCase extends IExecute {
  final LoginRepository _repository;

  ForgotPasswordUseCase(this._repository);

  @override
  Future<ResetPasswordResponse> call(String? email) async {
    return await _repository.resetPassword(email);
  }
}
