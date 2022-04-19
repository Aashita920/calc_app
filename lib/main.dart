// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int firstnum = 0;
  int secondnum = 0;
  String texttodisplay = "";
  String res = "";
  String operatortoperform = "";
  void buttonclicked(String buttonValue) {
    if (buttonValue == "C") {
      texttodisplay = "";
      firstnum = 0;
      secondnum = 0;
      res = "";
    } else if (buttonValue == "+" ||
        buttonValue == "-" ||
        buttonValue == "X" ||
        buttonValue == "/") {
      firstnum = int.parse(texttodisplay);
      res = "";
      operatortoperform = buttonValue;
    } else if (buttonValue == "=") {
      secondnum = int.parse(texttodisplay);
      if (operatortoperform == "+") {
        res = (firstnum + secondnum).toString();
      }
      if (operatortoperform == "-") {
        res = (firstnum - secondnum).toString();
      }
      if (operatortoperform == "X") {
        res = (firstnum * secondnum).toString();
      }
      if (operatortoperform == "/") {
        res = (firstnum ~/ secondnum).toString();
      }
    } else {
      res = int.parse(texttodisplay + buttonValue).toString();
    }
    setState(() {
      texttodisplay = res;
    });
  }

  Widget custombutton(String buttonValue) {
    return Expanded(
      child: OutlineButton(
        padding: const EdgeInsets.all(25.0),
        onPressed: () => buttonclicked(buttonValue),
        child: Text(
          "$buttonValue",
          style: const TextStyle(fontSize: 25.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator"),
      ),
      body: Container(
        alignment: Alignment.bottomRight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
                child: Container(
              padding: const EdgeInsets.all(10.0),
              alignment: Alignment.bottomRight,
              child: Text(
                "$texttodisplay",
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
            )),
            Row(children: [
              custombutton("9"),
              custombutton("8"),
              custombutton("7"),
              custombutton("+"),
            ]),
            Row(children: [
              custombutton("6"),
              custombutton("5"),
              custombutton("4"),
              custombutton("-"),
            ]),
            Row(children: [
              custombutton("3"),
              custombutton("2"),
              custombutton("1"),
              custombutton("X"),
            ]),
            Row(children: [
              custombutton("C"),
              custombutton("0"),
              custombutton("="),
              custombutton("/"),
            ]),
          ],
        ),
      ),
    );
  }
}
