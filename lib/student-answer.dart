import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:page_transition/page_transition.dart';
import 'package:handwritten_answer_evaluator/image-page.dart';
import 'package:handwritten_answer_evaluator/display-images.dart';
class StudentAnswer extends StatefulWidget {
  File teacherAnswer;
  StudentAnswer({this.teacherAnswer});
  @override
  _StudentAnswerState createState() => _StudentAnswerState();
}

class _StudentAnswerState extends State<StudentAnswer> {
  File image;
  callback(newImage) {
    setState(() {
      image = newImage;
    });
  }
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
    // final controller = PageController(initialPage: 0);
    return Scaffold(
      appBar: AppBar(
        title: Text('Student CHECKER'),
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
              ImagePage(width:width,height:height,image:image,blackboardImage: 'assets/images/blackboard2.jpg',callback: callback,),
              ButtonTheme(
                minWidth: 70,
                height: 50,
                child: RaisedButton(
                  color: Colors.brown[800],
                  onPressed: ()async{
                    Navigator.push(context,

                      PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: DisplayImages(teacherAnswer: widget.teacherAnswer,studentAnswer:image,),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      Text(
                        'EVALUATE',
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
