import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutUserPage extends StatelessWidget {
  final FirebaseAuth user;

  AboutUserPage({this.user});

  @override
  Widget build(BuildContext context) {
    final User = user.currentUser;
    return Scaffold(
      backgroundColor: Color(0xFF1D1E33),
      appBar: AppBar(
        backgroundColor: Color(0xFF1D1E33),
        centerTitle: true,
        title: Text('User Info'),
      ),
      body: Container(
        color:  Color(0xFF1D1E33),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              maxRadius: 140,
              backgroundImage: NetworkImage(User.photoURL),
            ),
            SizedBox(height: 15),
            Center(
              child: Text(
                'Name: ' + User.displayName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
            SizedBox(height: 15),
            Center(
              child: Text(
                'Email: ' + User.email,
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
