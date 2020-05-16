import 'package:flutter/material.dart';
import 'package:quizzy_app/models/Question.dart';

class ShowQuestions extends StatefulWidget {
  final List<Question> questions;

  const ShowQuestions(this.questions, {Key key,}) : super(key: key);
  
  @override
  _ShowQuestionsState createState() => _ShowQuestionsState();
}

class _ShowQuestionsState extends State<ShowQuestions> {
  
  int currQueIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(height: MediaQuery.of(context).padding.top),
          SizedBox(height: 15,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("Question ${(currQueIndex+1).toString()} / ", style: TextStyle(fontSize: 35, fontWeight: FontWeight.w600, shadows: [Shadow(color: Colors.black12, offset: Offset(-3, 4))])),
              Text("${widget.questions.length.toString()}", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600, shadows: [Shadow(color: Colors.black12, offset: Offset(-3, 4))])),
            ],
          ),
          SizedBox(height: 40,),
          Text("${widget.questions[currQueIndex].question}", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600, shadows: [Shadow(color: Colors.black12, offset: Offset(-3, 4))])),
        ],
      ),
    );
  }
}