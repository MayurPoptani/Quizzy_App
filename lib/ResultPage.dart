import 'package:flutter/material.dart';

import 'models/Answer.dart';
import 'models/Question.dart';


class ResultPage extends StatefulWidget {
  
  final List<int> userAnswerIndexes;
  final List<Question> questions;
  final Function resetQuizCallBack;

  const ResultPage({Key key, this.userAnswerIndexes, this.questions, this.resetQuizCallBack}) : super(key: key);
  
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  
  int marks = 0;
  @override
  void initState() {
    for(int i = 0 ; i < widget.questions.length ; i++) {
      print("Que ${(i+1).toString()} Correct Answer Number = ${Answer.getCorrectAnswerIndex(widget.questions[i].answerOptions).toString()}");
      if(Answer.getCorrectAnswerIndex(widget.questions[i].answerOptions)==widget.userAnswerIndexes[i])
        marks++;
    }
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        color: Colors.transparent,
        width: double.maxFinite,
        height: double.maxFinite,
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
                  Text("Your Score", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600, shadows: [Shadow(color: Colors.black12, offset: Offset(-3, 4))]) ),
                  Text(marks.toString()+" / 5", style: TextStyle(fontSize: 70, letterSpacing: 0.5, fontWeight: FontWeight.w600, shadows: [Shadow(color: Colors.black12, offset: Offset(-3, 4))]) ),
                  SizedBox(height: 10,),
                  OutlineButton(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    child: Text("Start Again", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600, shadows: [Shadow(color: Colors.black12, offset: Offset(-3, 4))]) ),
                    borderSide: BorderSide(color: Colors.white, width: 3),
                    highlightedBorderColor: Colors.white,
                    onPressed: () => widget.resetQuizCallBack(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}