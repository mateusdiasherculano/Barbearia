import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/images/logo.png'),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/images/logoseta.png'),
                const SizedBox(height: 40),
                const Text(
                  'Book your haircut\n     in seconds',
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                    'Schedule your next haircut within a few seconds. Easily reserve and manage your appointments.',
                    style: TextStyle(color: Color(0xFF9F9A9A), fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 50, // Distância do fundo da tela
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Modular.to.pushNamed('/login');
                    },
                    child: Image.asset(
                      'assets/images/Login.png',
                      key: const Key('login_key'),
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Modular.to.pushNamed('/register');
                    },
                    child: Image.asset(
                      'assets/images/Register.png',
                      key: const Key('register_key'),
                    ),
                  ), // Sua segunda imagem
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
