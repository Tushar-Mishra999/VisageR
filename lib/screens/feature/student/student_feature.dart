import 'dart:io';

import 'package:facialrecognition_attendance/components/rounded_button.dart';
import 'package:facialrecognition_attendance/screens/feature/student/student_view_attendance.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class StudentFeature extends StatelessWidget {
  StudentFeature({Key? key, required this.startime, required this.endtime})
      : super(key: key);

  final String startime;
  final String endtime;
  File? image;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          RoundedButton(
              title: 'View Attendance',
              size: size,
              func: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ViewAttendance()));
              }),
          SizedBox(
            height: size.height * 0.05,
          ),
          RoundedButton(
              title: 'Mark Attendance',
              size: size,
              func: () async {
                try {
                  int currenthour = DateTime.now().hour;
                  int currentminute = DateTime.now().minute;
                  int slothour = int.parse(startime.split(':')[0]);
                  if ((endtime.split(":")[1] == '55' &&
                          currentminute <= 55 &&
                          currenthour == slothour) &&
                      ((endtime.split(":")[1] == '25' &&
                          currentminute <= 25 &&
                          currenthour + 1 == slothour))) {
                             final image = await ImagePicker().pickImage(
                      source: ImageSource.camera,
                      preferredCameraDevice: CameraDevice.front);
                  if (image == null) {
                    return;
                  }
                  final imageFile = File(image.path);
                  } else {
                    Fluttertoast.showToast(
                        msg: "Attendance is currently disabled");
                  }

                 
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
