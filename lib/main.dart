import 'package:flutter/material.dart';

import 'QuizPage.dart';
import 'widgets/MyMultiColorContainer.dart';


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
      body: Stack(
        children: <Widget>[
          MultiColorContainer(),
          Container(
            width: double.maxFinite,
            padding: EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      SizedBox(height: 20,),
                      Text("Welcome To", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600, shadows: [Shadow(color: Colors.black12, offset: Offset(-3, 4))]) ),
                      Text("Quizzy", style: TextStyle(fontSize: 70, fontWeight: FontWeight.w600, shadows: [Shadow(color: Colors.black12, offset: Offset(-3, 4))]) ),
                      SizedBox(height: 40,),
                      OutlineButton(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        child: Text("Let's Start", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600, shadows: [Shadow(color: Colors.black12, offset: Offset(-3, 4))]) ),
                        borderSide: BorderSide(color: Colors.white, width: 3),
                        highlightedBorderColor: Colors.white,
                        onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => QuizPage())),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: Text("Developed By \"Mayur Poptani\" as a submission \nfor FlutterKerala Week 2 Task", style: TextStyle(fontSize: 15, shadows: [Shadow(color: Colors.white12, offset: Offset(-3, 4))]), textAlign: TextAlign.center,),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}