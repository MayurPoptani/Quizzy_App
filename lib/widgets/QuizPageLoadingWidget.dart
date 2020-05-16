import 'package:flutter/material.dart';

class QuizPageLoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Container(
            height: 125, width: 125,
            padding: const EdgeInsets.all(10),
            child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white), backgroundColor: Colors.black12, strokeWidth: 20,),
            decoration: BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle,
              boxShadow: []
            ),
          ),
        ),
        Container(
          height: 20,
        ),
        Text("Fetching Questions", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, shadows: [Shadow(color: Colors.black12, offset: Offset(-3, 4))]) ),
        
      ],
    );
  }
}