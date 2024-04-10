import 'package:barbearia/app/features/log_in/presenter/login_controller.dart';
import 'package:barbearia/app/features/log_in/presenter/login_state.dart';
import 'package:barbearia/components/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Modular.get<LoginController>();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return BlocProvider(
      create: (context) => controller,
      child: Scaffold(
        body: BlocConsumer<LoginController, LoginState>(
          listener: (context, state) {
            if (state is ErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.red,
                ),
              );
            } else if (state is LoadedState) {
              // Redirecionar o usuário para a HomePage(que ainda nao existe )
              Modular.to.pushReplacementNamed('');
            }
          },
          builder: (context, state) {
            if (state is LoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return buildLoginForm(
                  context, controller, emailController, passwordController);
            }
          },
        ),
      ),
    );
  }

  Widget buildLoginForm(
    BuildContext context,
    LoginController controller,
    TextEditingController emailController,
    TextEditingController passwordController,
  ) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // Centralizar na vertical
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 25),
                child: Image.asset('assets/images/logoseta.png'),
              ),
              const Text(
                'Welcome Back.',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                  height:
                      15), // Adicionar um espaço entre o texto e o formulário
              ///Formulário
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 40,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(45),
                  ),
                ),
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    /// email
                    CustomTextField(
                      controller: emailController,
                      icon: Icons.email,
                      label: 'Email',
                      borderRadius: 0, // Bordas quadras
                    ),

                    ///senha
                    CustomTextField(
                      controller: passwordController,
                      icon: Icons.lock,
                      label: 'Enter your password',
                      isSecret: true,
                      borderRadius: 0, // Bordas quadras
                    ),

                    /// Botão "Forgot password?"
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          // Ação para redefinir a senha
                        },
                        child: const Text(
                          'Forgot password?',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),

                    /// Widget para colocar imagem
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: GestureDetector(
                        onTap: () {
                          //chama a funçao que valida os dados do usuario
                        },
                        child: Image.asset('assets/images/Login.png'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
