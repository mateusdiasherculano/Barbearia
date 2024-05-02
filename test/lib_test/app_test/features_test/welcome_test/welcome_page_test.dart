import 'package:barbearia/app/features/welcome/presenter/welcome_page.dart';
import 'package:barbearia/app_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // Configuração do Flutter Modular antes de cada teste
  setUpAll(() {
    // Inicialize o Flutter Modular antes de todos os testes
    Modular.init(AppModule());
  });

  testWidgets('WelcomePage Widget Test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: WelcomePage(),
    ));
    expect(find.byType(WelcomePage), findsOneWidget);
  });

  testWidgets('WelcomePage Text and Image Test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: WelcomePage(),
    ));
    expect(find.text('Book your haircut\n     in seconds'), findsOneWidget);
    expect(
        find.text(
            'Schedule your next haircut within a few seconds. Easily reserve and manage your appointments.'),
        findsOneWidget);
    expect(find.byType(Image),
        findsNWidgets(4)); // Verifica a presença de 4  imagens
  });
  // criar teste de navegaçao logo a abaixo

  testWidgets('WelcomePage Layout Test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: WelcomePage(),
    ));

    expect(
        find.descendant(of: find.byType(Stack), matching: find.byType(Image)),
        findsNWidgets(4)); // Verifica a presença de 4 imagens no Stack
    expect(
        find.descendant(of: find.byType(Stack), matching: find.byType(Center)),
        findsOneWidget); // Verifica a presença de um Center no Stack
    expect(
        find.descendant(
            of: find.byType(Stack), matching: find.byType(Positioned)),
        findsOneWidget); // Verifica a presença de um Positioned no Stack
  });

  testWidgets('WelcomePage Navigate Test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: WelcomePage(),
      ),
    );

    final loginKey = find.byKey(const Key('login_key'));
    tester.ensureVisible(find.byKey(const Key('login_key')));
    await tester.tap(loginKey);
    await tester.pumpAndSettle();

    expect(find.image(const AssetImage('images/logoseta.png')), findsOneWidget);

    final registerKey = find.byKey(const Key('register_key'));
    await tester.tap(registerKey);
    await tester.pumpAndSettle();

    expect(find.byType(Scaffold), findsOneWidget);
  });

  tearDownAll(() {
    // Limpeza após todos os testes
    Modular.dispose();
  });
}
