import 'package:flutter/material.dart';
import 'package:handwritten_answer_evaluator/home.dart';
// void main() {
//   runApp(MaterialApp(
//     title: 'Ninja Trips',
//     initialRoute: '/home',
//     routes: {
//       '/home': (context) => Home(),
//       '/signup': (context) => SignUp(),
//     },
//   ));
// }

void main()=> runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(fontFamily: 'NotoSerif'),
      home: Home(),
      title: 'VoteHub',
      // initialRoute: '/wrapper',
    );
  }
}