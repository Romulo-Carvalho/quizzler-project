import "question.dart";

class QuizBrain {
  
  int _questionNumber = 0;

  final List<Question> _questionBank = [
    Question(questionText: 'Você pode levar uma vaca para descer escadas, mas não para subir.', questionAnswer: false),
    Question(questionText: 'Aproximadamente um quarto dos ossos humanos estão nos pés.', questionAnswer: true),
    Question(questionText: 'O sangue de uma lesma é verde.', questionAnswer: true),
    Question(questionText: 'A primeira programadora da história foi Ada Lovelace.', questionAnswer: true),
    Question(questionText: 'O processador executa código Python nativamente sem necessidade de um interpretador.', questionAnswer: false),
    Question(questionText: 'No universo de Saint Seiya, existem 12 Armaduras de Ouro que protegem o Santuário.', questionAnswer: true),
    Question(questionText: 'A memória RAM armazena dados permanentemente mesmo após o computador ser desligado.', questionAnswer: false),
    Question(questionText: 'Flutter utiliza a linguagem de programação Dart para o desenvolvimento de apps.', questionAnswer: true),
    Question(questionText: 'Um endereço MAC é um identificador único atribuído a uma interface de rede.', questionAnswer: true),
    Question(questionText: 'O Cavaleiro de Ouro de Libra é o mestre de Shiryu de Dragão.', questionAnswer: true),
    Question(questionText: 'Um compilador traduz o código-fonte diretamente em linguagem de máquina ou código intermediário.', questionAnswer: true),
    Question(questionText: 'Em Dart, os tipos "int" e "double" são escritos com a primeira letra maiúscula.', questionAnswer: false),
    Question(questionText: 'O número zero é considerado um número par.', questionAnswer: true),
  ];

  void nextQuestion(){

    if(_questionNumber < _questionBank.length - 1){
      _questionNumber++;
    }

  }

  String getQuestionText(){

    return _questionBank[_questionNumber].questionText;

  }

  bool getCorrectAnswer(){

    return _questionBank[_questionNumber].questionAnswer;

  }

  bool isFinished(){
    if(_questionNumber < _questionBank.length - 1){
      return false;
    }
    else{
      return true;
    }
  }

  void reset(){
    _questionNumber = 0;
  }

  void cleanList(){

  }
}