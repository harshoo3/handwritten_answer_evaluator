import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:dotted_decoration/dotted_decoration.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  File image;
  final picker = ImagePicker();
  bool image1Chosen = false;

  chooseImage() async {
    if (image1Chosen == false) {
      final pickedFile = await picker.getImage(source: ImageSource.gallery);
      setState(() {
        // _image.add(File(pickedFile?.path));
        image = File(pickedFile?.path);
      });
      print(pickedFile.path);
      if (pickedFile.path == null)
        retrieveLostData();
      else
        image1Chosen = true;
    }
  }
  temp(){
    print('hi');
  }
  Future<void> retrieveLostData() async {
    final LostData response = await picker.getLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      setState(() {
        // _image.add(File(response.file.path));
        image = File(response.file.path);
      });
    } else {
      print(response.file);
    }
  }

  @override
  Widget build(BuildContext context) {
    // FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
    final controller = PageController(initialPage: 0);
    return Scaffold(
        appBar: AppBar(
          title: Text('Answer Checker'),
          centerTitle: true,
          brightness: Brightness.dark,
          backgroundColor: Colors.deepPurple,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          // child: SingleChildScrollView(
          child: Center(
            child: Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                PageView(controller: controller,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          // color: ,
                          width: 170,
                          height: 120,
                          // margin: EdgeInsets.only(top: 20),
                          child: Image(
                            image: AssetImage('assets/images/blackboard2.jpg'),
                            fit: BoxFit.fill,),
                        ),
                        Flexible(
                          child: Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            height: 400,
                            child: Stack(
                              alignment: AlignmentDirectional.topCenter,
                              children: [
                              FractionallySizedBox(
                              widthFactor: 0.7,
                              heightFactor: 0.7,
                              child: Container(
                                // margin: EdgeInsets.fromLTRB(20,10 , 20, 20),
                                padding: EdgeInsets.all(20),
                                decoration: DottedDecoration(
                                    shape: Shape.box,
                                    borderRadius:
                                    BorderRadius.only(
                                        topLeft: Radius.circular(10)),
                                    dash: <int>[2, 5],
                                    strokeWidth: 2),
                                child: image == null
                                    ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(child: Text("Upload the image here",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 25, color: Colors.grey),)),
                                    IconButton(
                                      icon: Icon(Icons.upload_file),
                                      onPressed: () => chooseImage(),
                                      color: Colors.grey,
                                      iconSize: 40,
                                    ),
                                    // image == null
                                    //     ? SizedBox(),
                                  ],
                                // ) : Container(
                                //   child: Ink.image(
                                //     image: FileImage(image),
                                //     fit: BoxFit.fill,
                                //     child: InkWell(onDoubleTap: temp(),),
                                //   ),
                                // ),
                                ) :Container(child: ConstrainedBox(
                                        constraints: BoxConstraints.expand(),
                                        child: FlatButton(
                                            onPressed: temp(),
                                            padding: EdgeInsets.all(0.0),
                                            child: Image(
                                              image: FileImage(image),
                                              fit: BoxFit.fill,
                                            )))),
                                //   widget(
                                //     child: Container(
                                //       margin: EdgeInsets.all(3),
                                //       decoration: BoxDecoration(
                                //           image: DecorationImage(
                                //             fit: BoxFit.fill,
                                //             image: FileImage(image),
                                //           )),
                                //     ),
                                //   ),
                                // ),
                              ),
                              ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      color: Colors.yellow,
                    ),
                  ],),
              ],
            ),
          ),
          // ),
        ));
  }
}
