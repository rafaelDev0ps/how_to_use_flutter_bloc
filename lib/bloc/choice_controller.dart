import 'package:rxdart/rxdart.dart';

class ChoiceController {
  final BehaviorSubject<String> _subjectChoice = BehaviorSubject<String>();
  BehaviorSubject<String> get subjectChoice => _subjectChoice;

  // fecha fluxo de dados
  dispose() {
    _subjectChoice.close();
  }

  initSubjects() {
    _subjectChoice.sink.add("Hi");
  }

  setChoice(String newChoice) {
    _subjectChoice.sink.add(newChoice);
  }
}

final choiceController = ChoiceController();