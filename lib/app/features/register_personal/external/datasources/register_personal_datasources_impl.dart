import 'package:barbearia/app/models/user_profile_model.dart';
import 'package:barbearia/libraries/core/src/app_utils/app_utils.dart';
import 'package:barbearia/libraries/core/src/error/failure.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../infra/datasources/register_personal_datasources.dart';

class RegisterPersonalDatasourcesImpl extends RegisterPersonalDatasources {
  final FirebaseFirestore _db = Modular.get();
  @override
  Future<Profile> registerPersonal(
      String? name, String? email, String? password, String? phone) async {
    try {
      // Criação da instancia de Profile com os dados recebidos por parametro
      Profile profile = Profile(
        name: name,
        email: email,
        phone: password,
        password: phone,
      );

      // Conversão da instancia de profile para json
      Map<String, dynamic> profileData = profile.toJson();

      // Adição do documento na coleção "Users" do Firestore
      await _db.collection("Users").add(profileData);

      // Retorno da instancia de Profile
      return profile;
    } on FirebaseException catch (e) {
      if (e.code == 'network-request-failed') {
        throw 'Verifique sua rede.';
      } else {
        throw Failure(
            label: 'Datasource-registerPersonal',
            exception: e,
            message: AppUtils.getFirebaseErrorMessage(e) ?? e.message);
      }
    }
  }
}
