import 'package:barbearia/app/features/register_personal/domain/repository/register_personal_repository.dart';
import 'package:barbearia/app/models/user_profile_model.dart';

import '../datasources/register_personal_datasources.dart';

class RegisterPersonalRepositoryImpl extends RegisterPersonalRepository {
  final RegisterPersonalDatasources _datasources;

  RegisterPersonalRepositoryImpl(this._datasources);
  @override
  Future<Profile> registerPersonal(
      String? name, String? email, String? password, String? phone) async {
    return await _datasources.registerPersonal(name, email, password, phone);
  }
}
