import 'package:flutter/material.dart';

import 'widgets/MyMultiColorContainer.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          MultiColorContainer(),
          Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  
  getQuestionsFromDatabase() async {
    
  }
  
  
}