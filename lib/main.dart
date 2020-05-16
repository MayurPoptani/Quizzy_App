import 'package:flutter/material.dart';

import 'QuizPage.dart';


void main() {
  runApp(QuizzyApp());
}

class QuizzyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Text("Welcome To"),
            Text("Quizzy"),
            SizedBox(height: 20,),
            RaisedButton(
              child: Text("Let's Start",),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => QuizPage())),
            )
          ],
        ),
      ),
    );
  }
}