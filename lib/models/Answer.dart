class Answer {
  final String answer;
  final bool isCorrect;

  Answer(this.answer, this.isCorrect);
  
  static List<Answer> getAnswersList(dynamic answersData) {
    List<Answer> list = [];
    return list;
  }
  
  static int getCorrectAnswerIndex(List<Answer> list) {
    int index = -1;
    for(int i = 0 ; i < list.length ; i++) {
      if(list[i].isCorrect) {
        index = i;
        break; 
      }
    }
    return index;
  }
  
}