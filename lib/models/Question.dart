import 'Answer.dart';

class Question {
  
  final String question;
  final List<Answer> answerOptions;
  int correctAnswerIndex;

  Question(this.question, this.answerOptions);

  static fromMap(Map<String,dynamic> questionData) {
    var question = Question(questionData["Questions"], Answer.getAnswersList(questionData["Answers"]));
    question.correctAnswerIndex = Answer.getCorrectAnswerIndex(question.answerOptions);
    return question;
  }
  
  static getQuestionsList(Map<String,dynamic> data) {
    List<Question> ques = [];
    (data["Quiz Questions"] as List<dynamic>).forEach((element) {
      ques.add(Question.fromMap(element));
    });
    return ques;
  }  
}

