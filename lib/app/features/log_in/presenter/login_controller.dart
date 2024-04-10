import 'package:barbearia/app/features/log_in/presenter/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginController extends Cubit<LoginState> {
  LoginController() : super(InitialState());

  /* Future<void> sign(String email, String password) async {
    // Emitindo o estado de Loading para indicar que a autenticação está em andamento
    emit(LoadingState());

    try {
      // Simulando uma autenticação assíncrona
      await Future.delayed(Duration(seconds: 2));

      // Verificação simulada de credenciais
      if (email != '' && password != '') {
        // Emite o estado LoadedState para indicar que a autenticação foi bem-sucedida
        emit(LoadedState());
      } else {
        // Emite o estado ErrorState com uma mensagem de erro
        emit(ErrorState(
            'Credenciais inválidas. Por favor, verifique seu e-mail e senha.'));
      }
    } catch (e) {
      // Emite o estado ErrorState caso ocorra uma exceção durante a autenticação
      emit(ErrorState('Ocorreu um erro durante a autenticação: $e'));
    }
  }*/
}
