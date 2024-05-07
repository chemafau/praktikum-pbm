import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;

  final List<Question> _questionBank = [
    Question(questionText: 'Ibukota provinsi Jawa Barat adalah Bandung', questionAnswer: true),
    Question(questionText: 'Kupang merupakan ibukota dari provinsi Nusa Tenggara Barat', questionAnswer: false),
    Question(questionText: 'Rendang merupakan makanan khas dari daerah Sumatera Barat', questionAnswer: true),
    Question(questionText: 'Ibukota provinsi Bali adalah Denpasar', questionAnswer: true),
    Question(questionText: 'Jaipong adalah tarian daerah Jawa Barat', questionAnswer: true),
    Question(questionText: 'Ibukota dari provinsi Sulawesi Selatan adalah Manado', questionAnswer: false),
    Question(questionText: 'Salah satu makanan khas dari daerah Jawa Timur adalah Rujak Cingur', questionAnswer: true),
    Question(questionText: 'Es Selendang Mayang merupakan minuman khas Betawi', questionAnswer: true),
    Question(questionText: 'Pekanbaru adalah ibukota dari Provinsi Riau', questionAnswer: true),
    Question(questionText: 'Papeda merupakan makanan khas dari daerah Sumatera Selatan', questionAnswer: false),
    Question(questionText: 'Bahasa Sunda merupakan bahasa daerah Jawa Barat', questionAnswer: true),
    Question(questionText: 'Kerak Telor merupakan makanan khas daerah Betawi', questionAnswer: true),
    Question(questionText: 'Es Pisang Ijo adalah minuman khas daerah Banjarmasin', questionAnswer: false),
    Question(questionText: 'Pulau Komodo terletak di Provinsi Nusa Tenggara Timur', questionAnswer: true),
    Question(questionText: 'Tari Kecak merupakan tarian daerah Kalimantan Tengah', questionAnswer: false),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getCorrectAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  //TODO: Step 3 Part A - Create isFinished method that checks the last questions.
  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {
      print('returning true');
      return true;
    } else {
      return false;
    }
  }

  //TODO: Menghitung jumlah pertanyaan
  int getTotalQuestions() {
    return _questionBank.length;
  }

  //TODO: Step 4 Part B - Create a reset() method that sets the questionNumber back to 0
  void reset() {
    _questionNumber = 0;
  }
}

