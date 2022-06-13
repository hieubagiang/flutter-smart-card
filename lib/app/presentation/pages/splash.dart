import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  Splash({required Key key}) : super(key: key);
  final Color? backgroundColour = Colors.indigoAccent[100];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: backgroundColour,
      body: SizedBox(
        width: size.width,
        child: Center(
          child: Text(
            'Chill',
            style: TextStyle(color: Colors.white, fontSize: size.width * 0.2),
          ),
        ),
      ),
    );
  }
}
