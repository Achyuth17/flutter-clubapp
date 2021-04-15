import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'quiz_questions.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../page/user_page.dart';
import 'home_page.dart';

QuizBrain quizBrain = new QuizBrain();

class Quizzler extends StatelessWidget {

  final FirebaseAuth user;
  Quizzler({this.user});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Builder(
          builder: (context) => Scaffold(
            backgroundColor: Colors.black,
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: QuizPage(user: user,),
              ),
            ),
          ),
        ));
  }
}

class QuizPage extends StatefulWidget {

  final FirebaseAuth user;
  QuizPage({this.user});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {


  List<Widget> scoreKeeper = [];
  int noCrtAnswer = 0;
  int noOfQuestions = quizBrain.len();

  void checkAnswer(bool userAnswer) {
    bool crtAnswer = quizBrain.getAnswer();
    if (crtAnswer == userAnswer) {
      noCrtAnswer++;
    }
    setState(() {
      if (scoreKeeper.length < quizBrain.len() - 1) {
        if (crtAnswer == userAnswer) {
          scoreKeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          scoreKeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        quizBrain.nextQuestion();
      } else {
        Alert(
          context: context,
          type: AlertType.success,
          title: "FINISHED",
          desc: "Your score is $noCrtAnswer/$noOfQuestions !! ",
          buttons: [
            DialogButton(
              child: Text(
                "EXIT",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_)=>HomePage()));
                setState(() {
                  scoreKeeper.clear();
                  noCrtAnswer = 0;
                  quizBrain.reset();
                });
              },
              width: 120,
            ),
          ],
        ).show();
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Text(
                quizBrain.getQuestion(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
            child: Padding(
              padding: EdgeInsets.all(15),
              child: FlatButton(
                color: Colors.green,
                child: Text(
                  'True',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                onPressed: () {
                  checkAnswer(true);
                },
              ),
            )),
        Expanded(
            child: Padding(
              padding: EdgeInsets.all(15),
              child: FlatButton(
                  color: Colors.red,
                  child: Text(
                    'False',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  onPressed: () {
                    checkAnswer(false);
                  }),
            )),
        Padding(
          padding: const EdgeInsets.only(bottom: 5, left: 2),
          child: Row(
            children: scoreKeeper,
          ),
        ),
      ],
    );
  }
}

class ExitPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context) => Scaffold(
            appBar: AppBar(
              title: Text('Exit Page'),
            ),
            body: Center(
              child: Text(
                'Successfully completed the quiz',
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
            )),
      ),
    );
  }
}
