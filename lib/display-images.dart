import 'package:flutter/material.dart';
import 'dart:io';
class DisplayImages extends StatefulWidget {
  File studentAnswer,teacherAnswer;
  DisplayImages({this.studentAnswer,this.teacherAnswer});
  @override
  _DisplayImagesState createState() => _DisplayImagesState();
}

class _DisplayImagesState extends State<DisplayImages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Answer'),
      ),
      body: Column(
        children: [
          widget.teacherAnswer!=null?Container(
            height: 400,
            margin: EdgeInsets.all(3),
            decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: FileImage(widget.teacherAnswer),
                )),
          ):Text('null1'),
          widget.studentAnswer!=null?Container(
            height: 300,
            margin: EdgeInsets.all(3),
            decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: FileImage(widget.studentAnswer),
                )),
          ):Text('null2'),
        ],
      ),
    );
  }
}
