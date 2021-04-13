import 'package:app_state_learning/bloc/choice_controller.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'How to use BLoC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'How to use BLoC'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    super.initState();
    choiceController.initSubjects();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: StreamBuilder<String>(
              initialData: null,
              stream: choiceController.subjectChoice.stream,
              builder: (context, snapshot) {
                return PopupMenuButton<String>(
                  onSelected: choiceHandler,
                  itemBuilder: (BuildContext context) {
                    return {'Sentence 1', 'Sentence 2', 'Whooshhh'}.map((String choice) {
                      return PopupMenuItem<String>(
                        value: choice,
                        child: Text(choice),
                      );
                    }).toList();
                  },
                );
              },
            )
            )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StreamBuilder<String>(
              initialData: choiceController.subjectChoice.stream.value,
              stream: choiceController.subjectChoice.stream,
              builder: (context, snapshot) {
                return Text(snapshot.data);
              },
            )
          ],
        ),
      ),
    );
  }

  void choiceHandler(String choice) {
    choiceController.setChoice(choice);
    print(choiceController.subjectChoice.stream.value);
  }
}
