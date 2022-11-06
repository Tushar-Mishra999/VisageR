import 'dart:io';

import 'package:facialrecognition_attendance/components/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class StudentFeature extends StatelessWidget {
  StudentFeature({Key? key}) : super(key: key);
  File? image;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          RoundedButton(title: 'View Attendance', size: size, func: () {}),
          SizedBox(
            height: size.height * 0.05,
          ),
          RoundedButton(
              title: 'Mark Attendance',
              size: size,
              func: () async {
                try {
                  final image = await ImagePicker().pickImage(
                      source: ImageSource.camera,
                      preferredCameraDevice: CameraDevice.front);
                  if (image == null) {
                    return;
                  }
                  final imageFile = File(image.path);
                } on PlatformException catch (e) {
                  Fluttertoast.showToast(
                      msg: "Please give necessary permissions");
                }
              })
        ]),
      ),
    );
  }
}
