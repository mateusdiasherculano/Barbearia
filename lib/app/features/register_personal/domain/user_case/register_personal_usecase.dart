import 'package:barbearia/app/features/register_personal/domain/repository/register_personal_repository.dart';
import 'package:barbearia/app/models/user_profile_model.dart';

abstract class IExecute {
  Future<RegisterPersonalResponse> call(
      String name, String email, String password, String phone);
}

class RegisterPersonalUseCase extends IExecute {
  final RegisterPersonalRepository _repository;

  RegisterPersonalUseCase(this._repository);
  @override
  Future<RegisterPersonalResponse> call(
      String? name, String? email, String? password, String? phone) async {
    return await _repository.registerPersonal(name, email, password, phone);
  }
}
