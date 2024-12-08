// models.dart
class Question {
  final String question;
  final List<QuestionOption> questionOption;
  final int qid;
   final String imageUrl; 

  Question({required this.question, required this.questionOption, required this.qid,required this.imageUrl,});
}

class QuestionOption {
  final String answer;
  final int aid;

  QuestionOption({required this.answer, required this.aid});
}
