import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quizzy_app/models/Question.dart';

import 'ResultPage.dart';


class ShowQuestions extends StatefulWidget {
  final List<Question> questions;

  const ShowQuestions(this.questions, {Key key,}) : super(key: key);
  
  @override
  _ShowQuestionsState createState() => _ShowQuestionsState();
}

class _ShowQuestionsState extends State<ShowQuestions> with SingleTickerProviderStateMixin{
  
  int currQueIndex = 0;
  List<int> userAnswerIndexes;
  Timer timer;
  int perTickDurationinMilliseconds = 100;
  Duration currTickDuration = Duration(milliseconds: 0);
  bool completed = false;
  Widget child;
  
  @override
  void initState() {
    userAnswerIndexes = List.generate(widget.questions.length, (index) => -1);
    restartTimer();

    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    if(!completed) child = questionsScreenWidgets();
    return Container(
      height: double.maxFinite,//MediaQuery.of(context).size.height-50,
      width: double.maxFinite,
      child: Column(
        children: <Widget>[
          Expanded(
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 350),
              child: child,
              transitionBuilder: (child, animation) {
                return FadeTransition(opacity: animation, child: child, );
              },
            )
          ),
          //   child: AnimatedCrossFade(
          //     firstChild: questionsScreenWidgets(),
          //     secondChild: ResultPage(),
          //     duration: Duration(milliseconds: 350),
          //     crossFadeState: completed?CrossFadeState.showSecond:CrossFadeState.showFirst,
          //     firstCurve: Curves.fastOutSlowIn,
          //     secondCurve: Curves.fastOutSlowIn,
          //   ),
          // ),
        ],
      ),
      
    );
  }
  
  
  Widget questionsScreenWidgets() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(height: MediaQuery.of(context).padding.top),
        SizedBox(height: 15,),
        timerWidget(),
        SizedBox(height: 15,),
        Divider(color: Colors.white24, thickness: 2,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("Question ${(currQueIndex+1).toString()} / ", style: TextStyle(fontSize: 35, fontWeight: FontWeight.w600, shadows: [Shadow(color: Colors.black12, offset: Offset(-3, 4))])),
            Text("${widget.questions.length.toString()}", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600, shadows: [Shadow(color: Colors.black12, offset: Offset(-3, 4))])),
          ],
        ),
        Divider(color: Colors.white24, thickness: 2,),
        SizedBox(height: 10,),
        Text("${widget.questions[currQueIndex].question}", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600, shadows: [Shadow(color: Colors.black12, offset: Offset(-3, 4))])),
        optionButtons(),
        SizedBox(height: 40,),
        Container(
          alignment: Alignment.center,
          width: double.maxFinite,
          child: OutlineButton(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Text((currQueIndex==widget.questions.length-1)?"Submit And Finish":"Next", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600, shadows: [Shadow(color: Colors.black12, offset: Offset(-3, 4))]) ),
            borderSide: BorderSide(color: Colors.white, width: 2),
            highlightedBorderColor: Colors.white,
            onPressed: () {
              updatePage();
            },
          ),
        ),
      ],
    );
  }
  
  
  void updatePage() {
    if(timer.isActive) timer.cancel();
    if(currQueIndex==widget.questions.length-1) {
      completed=true;
      child = ResultPage(questions: widget.questions, userAnswerIndexes: userAnswerIndexes, resetQuizCallBack: () {
        userAnswerIndexes = List<int>.filled(widget.questions.length, -1);
        currQueIndex = 0;
        completed = false;
        restartTimer();
        setState(() {});
      },);
    } else {
      currQueIndex++;
      restartTimer();
    }
    setState(() {});
  }
  
  
  void restartTimer() {
    currTickDuration = Duration(milliseconds: 0);
    timer = Timer.periodic(Duration(milliseconds: perTickDurationinMilliseconds), (_timer) {
      currTickDuration = Duration(milliseconds: currTickDuration.inMilliseconds+perTickDurationinMilliseconds);
      if(currTickDuration.inSeconds>=30) {
        updatePage();
      }
      setState(() {});
    });
  }
  
  Widget optionButtons() {
    return Container(
      child: ListView(
        shrinkWrap: true,
        children: widget.questions[currQueIndex].answerOptions.map((e) {
          bool isSelected = userAnswerIndexes[currQueIndex]==widget.questions[currQueIndex].answerOptions.indexOf(e);
          return Card(
            elevation: 5,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            color: Colors.blue.shade900.withOpacity(0.75),
            margin: EdgeInsets.symmetric(vertical: 5),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
              dense: true,
              title: Text(e.answer, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, shadows: [Shadow(color: Colors.black12, offset: Offset(-3, 4))])),
              trailing: Icon(Icons.check_circle_outline, color: isSelected?Colors.amber:Colors.transparent, size: 30),
              onTap: () {
                userAnswerIndexes[currQueIndex] = widget.questions[currQueIndex].answerOptions.indexOf(e);
                setState(() {});
              },
            ),
          );
        }).toList(),
      ),
    );
  }
  
  Widget timerWidget() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            height: 50,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    //color: Colors.blue.shade900,
                    color: Colors.amber.shade600,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: currTickDuration.inMilliseconds,
                          child: AnimatedContainer(
                            duration: Duration(seconds: 1),
                            height: double.maxFinite,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: currTickDuration.inSeconds<=10?Colors.green.shade900:currTickDuration.inSeconds<=20?Colors.orange.shade900:Colors.red.shade900.withOpacity(0.85),
                            ),
                            child: Text(currTickDuration.inSeconds.toString(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, shadows: [Shadow(color: Colors.black12, offset: Offset(-3, 4))])),
                            alignment: Alignment.center,
                          ),
                        ),
                        Expanded(
                          flex: Duration(seconds: 30).inMilliseconds-currTickDuration.inMilliseconds,
                          child: Container()
                        ),
                        
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(width: 5),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.timer, size: 30, color: Colors.white),
              SizedBox(width: 3),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text("30", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w800, shadows: [Shadow(color: Colors.black12, offset: Offset(-3, 4))])),
                  Text("secs", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w800, shadows: [Shadow(color: Colors.black12, offset: Offset(-3, 4))])),
                  SizedBox(height: 4),
                ],
              )
            ],
          ),
        ),
        SizedBox(width: 5),
      ],
    );
  }
  
  @override
  void dispose() { 
    if(timer.isActive) {
      timer.cancel();
    }
    super.dispose();
  }
  
}