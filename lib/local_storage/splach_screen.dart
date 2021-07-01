import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wac2_flutter/local_storage/file_helper.dart';
import 'package:wac2_flutter/local_storage/sp_helper.dart';

class SplachScreen extends StatefulWidget {
  @override
  _SplachScreenState createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bool result = Sphelper.sphelper.checkFirstTime();
    Future.delayed(Duration(seconds: 3)).then((value) {
      if (result) {
        // do somthing ( download )
        Sphelper.sphelper.setFirstTime();
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) {
          return CheckerPage('first time');
        }));
      } else {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) {
          return CheckerPage('old user');
        }));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: FlutterLogo(),
      ),
    );
  }
}

class CheckerPage extends StatefulWidget {
  String title;
  CheckerPage(this.title);

  @override
  _CheckerPageState createState() => _CheckerPageState();
}

class _CheckerPageState extends State<CheckerPage> {
  File image;
  List<File> files;
  convertFunction(List<PickedFile> pickedFiles) {
    files = pickedFiles.map((e) => File(e.path)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: InkWell(
            onTap: () async {
              List<PickedFile> list = await ImagePicker().getMultiImage();
              convertFunction(list);
              // PickedFile pickedFile =
              //     await ImagePicker().getImage(source: ImageSource.camera);
              // image = File(pickedFile.path);
              // setState(() {});
              // FileHelper.fileHelper.readFromFile();
            },
            child: files == null
                ? Container(
                    margin: EdgeInsets.all(20),
                    height: 400,
                    width: 400,
                    color: Colors.grey,
                  )
                : ListView.builder(
                    itemCount: files.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(20),
                        height: 400,
                        width: 400,
                        color: Colors.grey,
                        child: Image.file(
                          files[index],
                          fit: BoxFit.cover,
                        ),
                      );
                    })

            // Container(
            //   margin: EdgeInsets.all(20),
            //   height: 400,
            //   width: 400,
            //   color: Colors.grey,
            //   child: image == null
            //       ? Container()
            //       : Image.file(image, fit: BoxFit.cover),
            // )

            ),
      ),
    );
  }
}
