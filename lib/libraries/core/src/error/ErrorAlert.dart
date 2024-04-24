import 'package:flutter/material.dart';

class ErrorAlert extends StatelessWidget {
  final String? message;

  const ErrorAlert({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color(0x0fe10a5d),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 8, left: 8, top: 1.5),
                child: Image.asset('assets/images/redAlert.png'),
              ),
              Flexible(
                child: Text.rich(TextSpan(children: [
                  TextSpan(
                    text: '$message',
                  )
                ])),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
