import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

enum Answer { YES, NO, MAYBE }

class _State extends State<MyApp> {
  String _answer = '';

  void setAnswer(String value) {
    setState(() {
      _answer = value;
    });
  }

  Future<Null> _askuser() async {
    switch (await showDialog(
        context: context,
        child: new SimpleDialog(
          title: new Text('Do you like Icecream?'),
          children: <Widget>[
            new SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, Answer.YES);
              },
              child: const Text('Yes'),
            ),
            new SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, Answer.NO);
              },
              child: const Text('No'),
            ),
            new SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, Answer.MAYBE);
              },
              child: const Text('May Be'),
            )
          ],
        ))) {
      case Answer.YES:
        setAnswer('Yes');
        break;
      case Answer.NO:
        setAnswer('No');
        break;
      case Answer.MAYBE:
        setAnswer('May be');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('Title')),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Column(
          children: <Widget>[
            new Text('You answered ${_answer}'),
            new RaisedButton(
                child: new Text('Click Me!'),
                onPressed: (){_askuser();})
          ],
        ),
      ),
    );
  }
}
