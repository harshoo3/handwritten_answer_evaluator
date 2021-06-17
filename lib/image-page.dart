import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
class ImagePage extends StatefulWidget {
  double height;
  double width;
  String blackboardImage;
  File image;
  ImagePage({this.height,this.width,this.blackboardImage,this.image});
  // Function cropImage,chooseImage,retrieveLostData;
  @override
  _ImagePageState createState() => _ImagePageState(height:height,width:width,blackboardImage:blackboardImage,image: image);
}

class _ImagePageState extends State<ImagePage> {
  double height;
  double width;
  String blackboardImage;
  File image;
  _ImagePageState({this.height,this.width,this.blackboardImage,this.image});
  final picker = ImagePicker();
  bool image1Chosen = false;
  chooseImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      // _image.add(File(pickedFile?.path));
      image = File(pickedFile?.path);
    });
    print(pickedFile.path);
    if (pickedFile.path == null)
      retrieveLostData();
  }
  cropImage(File picked) async {
    File cropped = await ImageCropper.cropImage(
      androidUiSettings: AndroidUiSettings(
        statusBarColor: Colors.brown[800],
        toolbarColor: Colors.brown[800],
        toolbarTitle: "Crop Image",
        toolbarWidgetColor: Colors.white,
        lockAspectRatio: false,
      ),
      sourcePath: picked.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio16x9,
        CropAspectRatioPreset.ratio4x3,
      ],
      maxWidth: 800,
    );
    if (cropped != null) {
      setState(() {
        image = cropped;
      });
    }
  }
  temp() {
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 15,),
        Container(
          // color: ,
          width: 170,
          height: 120,
          // margin: EdgeInsets.only(top: 20),
          child: Image(
            image: AssetImage(blackboardImage),
            fit: BoxFit.fill,
          ),
        ),
        Flexible(
          child: Container(
            width: width,
            height: 3*height / 7,
            child: Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                FractionallySizedBox(
                  widthFactor: 0.8,
                  heightFactor: 0.95,
                  child: Container(
                    // margin: EdgeInsets.fromLTRB(20,10 , 20, 20),
                    padding: EdgeInsets.all(20),
                    decoration: DottedDecoration(
                        shape: Shape.box,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10)),
                        dash: <int>[2, 5],
                        strokeWidth: 2),
                    child: image == null
                        ? Column(
                      mainAxisAlignment:
                      MainAxisAlignment.center,
                      children: [
                        Center(
                            child: Text(
                              "Upload the image here",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.grey),
                            )),
                        IconButton(
                          icon: Icon(Icons.upload_file),
                          onPressed: () => chooseImage(),
                          color: Colors.grey,
                          iconSize: 40,
                        ),
                        // image == null
                        //     ? SizedBox(),
                      ],
                    )
                        : Container(
                      margin: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fitWidth,
                            image: FileImage(image),
                          )),
                    ),
                    //   ),
                    // ),
                  ),
                ),
              ],
            ),
          ),
        ),
        // image!= null?ButtonTheme(
        Padding(
          padding: const EdgeInsets.only(left: 30,right: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.help,color: image==null?Colors.red:Colors.brown),
              Flexible(
                child: Text(image==null?'Please pick an image.':'It is highly recommended to crop the image to the answer.',
                  textAlign: TextAlign.center,
                  // overflow: TextOverflow.ellipsis,
                  // softWrap: true,
                  style: TextStyle(
                    color: image==null?Colors.red:Colors.brown,
                  ),),
              ),
            ],
          ),
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ButtonTheme(
              minWidth: 50,
              height: 50,
              child: RaisedButton(
                color: Colors.brown[800],
                onPressed: ()async{
                  if(image!=null){
                    await cropImage(image);
                  }
                },
                child: Row(
                  children: [
                    Text(
                      'Edit image  ',
                      style: TextStyle(color: Colors.white),
                    ),
                    Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
            ButtonTheme(
              minWidth: 50,
              height: 50,
              child: RaisedButton(
                color: Colors.brown[800],
                onPressed: ()=>chooseImage(),
                child: Row(
                  children: [
                    Text(
                      'Pick another  ',
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
        SizedBox(height: 25,),
        // ):SizedBox(),
      ],
    );
  }
}
