import 'package:barbearia/app/features/register/presenter/register_personal_page.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  int current = 0;
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 90),
          child: Text(
            'Register',
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [
          const PersonalInformationPage(),
          Container(color: Colors.red),
          Container(color: Colors.black),
          Container(color: Colors.yellow),
          Container(color: Colors.teal),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: current,
          onTap: (index) {
            setState(() {
              current = index;
              pageController.jumpToPage(index);
            });
          },
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.account_box),
              label: 'Personal ',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.image),
              label: 'Upload ',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.event_available),
              label: 'Preferences',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.monetization_on_outlined),
              label: 'Add Payment Method',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.done_all),
              label: 'Almost there',
            ),
          ]),
    );
  }
}
