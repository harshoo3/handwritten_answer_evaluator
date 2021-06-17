import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handwritten_answer_evaluator/student-answer.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:handwritten_answer_evaluator/image-page.dart';
import 'package:page_transition/page_transition.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  File image;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
    // final controller = PageController(initialPage: 0);
    return Scaffold(
        appBar: AppBar(
          title: Text('ANSWER CHECKER'),
          centerTitle: true,
          brightness: Brightness.dark,
          backgroundColor: Colors.brown[900],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          // child: SingleChildScrollView(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ImagePage(width:width,height:height,image:image,blackboardImage: 'assets/images/blackboard2.jpg',),
                ButtonTheme(
                  minWidth: 70,
                  height: 50,
                  child: RaisedButton(
                    color: Colors.brown[800],
                    onPressed: (){
                      // Navigator.push(context,
                      //     MaterialPageRoute(
                      //       builder: (context) => ,
                      //     ));
                      Navigator.push(context,
                      //     PageRouteBuilder(
                      //     transitionDuration: Duration(seconds: 1),
                      //     transitionsBuilder: (BuildContext context,
                      //         Animation<double> animation,
                      //         Animation<double>secAnimation,
                      //         Widget child){
                      //       animation = CurvedAnimation(parent: animation, curve:Curves.bounceInOut);
                      //       return ScaleTransition(scale: animation,
                      //         alignment: Alignment.centerRight,
                      //         child: child,);
                      //     },
                      //     pageBuilder: (BuildContext context,
                      //         Animation<double> animation,
                      //         Animation<double>secAnimation,){
                      //       return StudentAnswer(teacherAnswer: image,);
                      //     }
                      // ));
                      PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: StudentAnswer(teacherAnswer: image,),
                      ),
                      );
                    },
                    child: Row(
                      children: [
                        Text(
                          'PICK STUDENT ANSWER',
                          style: TextStyle(color: Colors.white),
                        ),
                        Icon(
                          Icons.add_circle_outlined,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          ),
        );
  }
}
