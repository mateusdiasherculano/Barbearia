import 'package:barbearia/app/features/register_personal/domain/repository/register_personal_repository.dart';
import 'package:barbearia/app/features/register_personal/domain/user_case/register_personal_usecase.dart';
import 'package:barbearia/app/features/register_personal/external/datasources/register_personal_datasources_impl.dart';
import 'package:barbearia/app/features/register_personal/infra/datasources/register_personal_datasources.dart';
import 'package:barbearia/app/features/register_personal/infra/repository/register_personal_repository_impl.dart';
import 'package:barbearia/app/features/register_personal/presenter/register_base_page.dart';
import 'package:barbearia/app/features/register_personal/presenter/register_personal_controller.dart';
import 'package:barbearia/app/features/register_personal/presenter/register_personal_store.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegisterModule extends Module {
  void binds(i) {
    i.addInstance<FirebaseAuth>(FirebaseAuth.instance);
    i.addInstance<FirebaseFirestore>(FirebaseFirestore.instance);
    i.addLazySingleton<RegisterPersonalDatasources>(
        RegisterPersonalDatasourcesImpl.new);
    i.addLazySingleton<RegisterPersonalRepository>(
        RegisterPersonalRepositoryImpl.new);
    i.addLazySingleton(RegisterPersonalUseCase.new);
    i.addLazySingleton(RegisterPersonalStore.new);
    i.addLazySingleton(RegisterPersonalController.new);
  }

  void routes(r) {
    r.child('/', child: (context) => const RegisterPage());
  }
}
