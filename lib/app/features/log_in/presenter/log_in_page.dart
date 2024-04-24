import 'package:barbearia/app/features/log_in/presenter/login_controller.dart';
import 'package:barbearia/components/custom_text_widget.dart';
import 'package:barbearia/libraries/core/src/error/ErrorAlert.dart';
import 'package:barbearia/libraries/core/src/extension/string_extensions.dart';
import 'package:barbearia/libraries/design_system/src/common/extension/widgets_extension.dart';
import 'package:barbearia/libraries/design_system/src/widgets/button/button_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController controller = Modular.get<LoginController>();
  final TextEditingController emailTextEditingController =
      TextEditingController();
  final TextEditingController passwordTextEditingController =
      TextEditingController();

  @override
  void initState() {
    controller.store.observer(onState: (state) {
      Modular.to.navigate('/welcome/');
    }, onError: (error) {
      ErrorAlert(
        message: error?.message,
      ).show(context);
    });
    super.initState();
  }

  @override
  void dispose() {
    emailTextEditingController.dispose();
    passwordTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFf6f6f6),
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 45),
                    Center(
                      child: Image.asset('assets/images/logoseta.png'),
                    ),
                    const SizedBox(height: 48),
                    const Text(
                      'Welcome Back.',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 45),
                    AnimatedBuilder(
                        animation: Listenable.merge([
                          controller.emailError,
                          controller.emailValidation
                        ]),
                        builder: (context, _) {
                          return AutofillGroup(
                            child: CustomTextField(
                              controller: emailTextEditingController,
                              icon: Icons.email,
                              label: 'Email',
                              keyboardType: TextInputType.emailAddress,
                              errorMessage: controller.emailError.value,
                              autofillHints: const <String>[
                                AutofillHints.email
                              ],
                              showValidated: controller.emailValidation.value,
                              onChanged: (value) {
                                controller.emailError.value = null;
                                controller.emailValidation.value =
                                    value.isEmail;
                              },
                              borderRadius: 0,
                            ),
                          );
                        }),
                    const SizedBox(height: 10),
                    AnimatedBuilder(
                        animation: controller.passwordError,
                        builder: (context, _) {
                          return AutofillGroup(
                              child: CustomTextField(
                            controller: passwordTextEditingController,
                            icon: Icons.lock,
                            label: 'password',
                            keyboardType: TextInputType.text,
                            errorMessage: controller.passwordError.value,
                            autofillHints: const <String>[
                              AutofillHints.password
                            ],
                            obscureText: true,
                            onChanged: (value) {
                              controller.passwordError.value = null;
                            },
                          ));
                        }),
                    const SizedBox(height: 8),
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
                    const SizedBox(height: 50),
                    AnimatedBuilder(
                        animation: controller.store.selectLoading,
                        builder: (context, _) {
                          return ButtonLoading(
                              onPressed: () {
                                FocusManager.instance.primaryFocus?.unfocus();
                                controller.login(
                                    emailTextEditingController.text,
                                    passwordTextEditingController.text);
                              },
                              text: 'LOG IN',
                              loading: controller.store.isLoading);
                        })
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
/*
  Widget buildLoginForm(
    BuildContext context,
    LoginController controller,
    TextEditingController emailTextEditingController,
    TextEditingController passwordTextEditingController,
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
                  children: [
                    /// email
                    CustomTextField(
                      controller: emailTextEditingController,
                      icon: Icons.email,
                      label: 'Email',
                      borderRadius: 0, // Bordas quadras
                    ),

                    ///senha
                    CustomTextField(
                      controller: passwordTextEditingController,
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
                          controller.login(emailTextEditingController.text,
                              passwordTextEditingController.text);
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
    );*/
