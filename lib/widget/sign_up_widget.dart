import 'package:flutter/material.dart';
import 'package:google_signin_example/widget/background_painter.dart';
import 'package:google_signin_example/widget/google_signup_button_widget.dart';
import 'package:google_signin_example/main.dart';

class SignUpWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark().copyWith(
      primaryColor: Color(0xFF0A0E21),
      scaffoldBackgroundColor: Color(0xFF0A0E21),
    ),
    home: Scaffold(

      body: Stack(
            fit: StackFit.expand,
            children: [
              CustomPaint(painter: BackgroundPainter()),
              buildSignUp(),
            ],
          ),
    ),
  );

  Widget buildSignUp() => Column(
        children: [
          Spacer(),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: 175,
              child: Text(
                'Welcome Back To PESU App',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Spacer(),
          GoogleSignupButtonWidget(),
          SizedBox(height: 12),
          Text(
            'Login to continue',
            style: TextStyle(fontSize: 16,color:Colors.green),

          ),
          Spacer(),
        ],
      );
}
