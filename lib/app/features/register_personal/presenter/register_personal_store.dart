import 'package:barbearia/app/models/user_profile_model.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../domain/user_case/register_personal_usecase.dart';

class RegisterPersonalStore extends Store<RegisterPersonalResponse> {
  final RegisterPersonalUseCase _useCase;
  RegisterPersonalStore(this._useCase) : super(RegisterPersonalResponse());

  Future<void> registerPersonal(
      String name, String email, String password, String phone) async {
    return execute(() => _useCase.call(name, email, password, phone));
  }
}
