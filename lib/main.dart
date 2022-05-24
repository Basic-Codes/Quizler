// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, avoid_print, non_constant_identifier_names

import 'dart:ffi';
import 'QuizController.dart';

import 'package:flutter/material.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  Icon checkIcon = Icon(
    Icons.check,
    color: Colors.green,
    size: 24.0,
  );
  Icon crossIcon = Icon(
    Icons.close,
    color: Colors.red,
    size: 30.0,
  );

  List<Icon> scoreKeeper = [];

  QuizController quizCtrl = new QuizController();

  void checkResult(user_ans) {
    if (quizCtrl.nextQues()) {
      if (user_ans == quizCtrl.getAns()) {
        setState(() {
          scoreKeeper.add(checkIcon);
        });
      } else {
        setState(() {
          scoreKeeper.add(crossIcon);
        });
      }
    }
  }

  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.purple[800],
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: Center(
                child: Text(
                  quizCtrl.getQues(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(16.0),
                        primary: Colors.blue,
                        textStyle: const TextStyle(fontSize: 20),
                        backgroundColor: Colors.green[600]),
                    child: const Text(
                      'True',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                    onPressed: () {
                      print("True Pressed");
                      checkResult(true);
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(16.0),
                        primary: Colors.blue,
                        textStyle: const TextStyle(fontSize: 20),
                        backgroundColor: Colors.red[600]),
                    child: const Text(
                      'False',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                    onPressed: () {
                      print("False Pressed");
                      checkResult(false);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: scoreKeeper,
          ),
        )
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
