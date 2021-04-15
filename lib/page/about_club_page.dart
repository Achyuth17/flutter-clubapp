import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutClubPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1D1E33),
      appBar: AppBar(
        backgroundColor: Color(0xFF1D1E33),
        centerTitle: true,
        title: Text('Club Info'),
      ),
      body: Container(
        color:  Color(0xFF1D1E33),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Text('PESU CLUB !',style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),)),
            SizedBox(height: 10,),
            Center(child: Text('Founder : AKK !',style: TextStyle(fontSize: 25),)),
          ],
        ),
      ),
    );
  }
}
