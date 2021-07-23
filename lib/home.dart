import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handwritten_answer_evaluator/student-answer.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:handwritten_answer_evaluator/image-page.dart';
import 'package:page_transition/page_transition.dart';
import 'package:starflut/starflut.dart';
import 'package:chaquopy/chaquopy.dart';
import 'dart:async';
import 'package:flutter/services.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  File image;
  String _platformVersion = 'Unknown';
  callback(newImage) {
    setState(() {
      image = newImage;
    });
  }
  // Future<void> initPlatformState() async {
  //   String platformVersion;
  //   // Platform messages may fail, so we use a try/catch PlatformException.
  //   try {
  //     StarCoreFactory starcore = await Starflut.getFactory();
  //     StarServiceClass Service = await starcore.initSimple("test", "123", 0, 0, []);
  //     await starcore
  //         .regMsgCallBackP((int serviceGroupID, int uMsg, Object wParam, Object lParam) async {
  //       print("$serviceGroupID  $uMsg   $wParam   $lParam");
  //
  //       return null;
  //     });
  //     StarSrvGroupClass SrvGroup = await Service["_ServiceGroup"];
  //
  //     /*---script python--*/
  //     bool isAndroid = await Starflut.isAndroid();
  //     if (isAndroid == true) {
  //       await Starflut.copyFileFromAssets(
  //           "testcallback.py", "flutter_assets/starfiles", "flutter_assets/starfiles");
  //       await Starflut.copyFileFromAssets(
  //           "testpy.py", "flutter_assets/starfiles", "flutter_assets/starfiles");
  //       await Starflut.copyFileFromAssets(
  //           "python3.6.zip", "flutter_assets/starfiles", null); //desRelatePath must be null
  //       await Starflut.copyFileFromAssets("zlib.cpython-36m.so", null, null);
  //       await Starflut.copyFileFromAssets("unicodedata.cpython-36m.so", null, null);
  //       await Starflut.loadLibrary("libpython3.6m.so");
  //     }
  //
  //     String docPath = await Starflut.getDocumentPath();
  //     print("docPath = $docPath");
  //     String resPath = await Starflut.getResourcePath();
  //     print("resPath = $resPath");
  //     dynamic rr1 = await SrvGroup.initRaw("python36", Service);
  //
  //     print("initRaw = $rr1");
  //     var Result = await SrvGroup.loadRawModule(
  //         "python", "", resPath + "/flutter_assets/starfiles/" + "testpy.py", false);
  //     print("loadRawModule = $Result");
  //     dynamic python = await Service.importRawContext(null,"python", "",false, "");
  //     print("python = " + await python.getString());
  //     StarObjectClass retobj = await python.call("tt", ["hello ", "world"]);
  //     print(await retobj[0]);
  //     print(await retobj[1]);
  //     print(await python["g1"]);
  //     StarObjectClass yy = await python.call("yy", ["hello ", "world", 123]);
  //     print(await yy.call("__len__", []));
  //     StarObjectClass multiply = await Service.importRawContext(null,"python", "Multiply",true, "");
  //     StarObjectClass multiply_inst = await multiply.newObject(["", "", 33, 44]);
  //     print(await multiply_inst.getString());
  //     print(await multiply_inst.call("multiply", [11, 22]));
  //     await SrvGroup.clearService();
  //     await starcore.moduleExit();
  //     platformVersion = 'Python 3.6';
  //   } on PlatformException catch (e) {
  //     print("{$e.message}");
  //     platformVersion = 'Failed to get platform version.';
  //   }
  //
  //   // If the widget was removed from the tree while the asynchronous platform
  //   // message was in flight, we want to discard the reply rather than calling
  //   // setState to update our non-existent appearance.
  //
  //   if (!mounted) return;
  //
  //   setState(() {
  //     _platformVersion = platformVersion;
  //   });
  //   print(platformVersion);
  // }
  @override
  void initState() {
    // TODO: implement initState
    // initPlatformState();
    super.initState();
  }
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
              ImagePage(width:width,height:height,image:image,blackboardImage: 'assets/images/blackboard2.jpg',callback: callback),
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
                      PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child:
                        //  MaterialPageRoute(builder: (context) =>
                        StudentAnswer(teacherAnswer: image,),
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
