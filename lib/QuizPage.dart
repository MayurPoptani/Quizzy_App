import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as Http;
import 'package:http/http.dart';
import 'package:quizzy_app/widgets/QuizPageLoadingWidget.dart';

import 'ShowQuestions.dart';
import 'models/Question.dart';
import 'widgets/MyMultiColorContainer.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  
  List<Question> questions;
  bool dataFetched = false;
  Widget child = QuizPageLoadingWidget();
  
  @override
  void initState() {
    fetchQuestionsList();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        showDialog(
          context: context,
          barrierDismissible: true,
          builder: (_) {
            return AlertDialog(
              backgroundColor: Colors.white,
              title: Text("Go Back To Home?", style: TextStyle(color: Colors.black),),
              actions: <Widget>[
                FlatButton(
                  child: Text("Yes", style: TextStyle(color: Colors.black),),
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();  
                  },
                ),
                FlatButton(
                  child: Text("No", style: TextStyle(color: Colors.black),),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          }
        );
        return false;
      },
      child: Scaffold(
        body: Container(
          child: Stack(
            children: <Widget>[
              Container(
                child: MultiColorContainer(),
                foregroundDecoration: dataFetched?BoxDecoration(color: Colors.black26):null,
              ),
              Column(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      child: AnimatedSwitcher(
                        duration: Duration(milliseconds: 350),
                        child: child,
                        transitionBuilder: (child, animation) {
                          return FadeTransition(opacity: animation, child: child, );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  
  fetchQuestionsList() async {
    Map<String,dynamic> data;
    try{
      Response res = await Http.get("http://www.mocky.io/v2/5ebd2f5f31000018005b117f");
      //print("Status Code = "+res.statusCode.toString());
      //print(res.body.toString());
      dataFetched = true;
      try{
        data = jsonDecode(res.body) as Map<String,dynamic>;
        await Future.delayed(Duration(seconds: 1));
        if(mounted) setState(() {
          questions = Question.getQuestionsList(data);
          child = ShowQuestions(questions);
        });
      } catch (e) {
        print("Failed To Decode String To Json. Exception = "+e.toString());
      }
      
    } catch (e) {
      print("Failed To Fetch Questions List. Exception = "+e.toString());
    }    
  }
  
  
}