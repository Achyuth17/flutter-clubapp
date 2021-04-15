import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_signin_example/page/quiz_page.dart';
import 'package:google_signin_example/provider/google_sign_in.dart';
import 'package:provider/provider.dart';
import '../widget/reusable_card.dart';
import 'about_user_page.dart';
import 'about_club_page.dart';

class UserPage extends StatelessWidget {
  final FirebaseAuth user;
  UserPage({this.user});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(user.currentUser.displayName.toString()),
        ),
        body: ChangeNotifierProvider(
          create: (context) => GoogleSignInProvider(),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: ReusableCard(
                        colour: Color(0xFF1D1E33),
                        cardChild: Center(
                          child: Text(
                            'User Info',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ),
                        onPress: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AboutUserPage(
                                user: user,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        colour: Color(0xFF1D1E33),
                          cardChild: Center(
                            child: Text(
                              'Club Info',
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                          ),
                          onPress: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AboutClubPage(),
                              ),
                            );
                          }
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ReusableCard(
                  colour: Color(0xFF1D1E33),
                  cardChild: Center(
                    child: Text(
                      'ATTEND QUIZ !',
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  onPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Quizzler(
                          user: user,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: ReusableCard(
                        colour: Color(0xFF1D1E33),
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        colour: Color(0xFF1D1E33),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  final provider =
                      Provider.of<GoogleSignInProvider>(context, listen: false);
                  provider.logout();
                },
                child: Container(
                  child: Center(
                    child: Text(
                      'LOG OUT !',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  color: Color(0xFFEB1555),
                  margin: EdgeInsets.only(top: 10),
                  width: double.infinity,
                  height: 70,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
