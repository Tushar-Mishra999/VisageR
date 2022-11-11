import 'dart:io';

import 'package:facialrecognition_attendance/components/rounded_button.dart';
import 'package:facialrecognition_attendance/screens/feature/student/student_view_attendance.dart';
import 'package:facialrecognition_attendance/services/mark_attendance.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../provider/user_provider.dart';

class StudentFeature extends StatefulWidget {
  StudentFeature({Key? key, required this.startime, required this.endtime})
      : super(key: key);

  final String startime;
  final String endtime;

  @override
  State<StudentFeature> createState() => _StudentFeatureState();
}

class _StudentFeatureState extends State<StudentFeature> {
  File? image;
  bool isLoading=false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children:[
          if (isLoading)
            const Center(
                            child: CircularProgressIndicator(
                          color: Colors.purple,
                        )),
          Center(
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
                    int slothour = int.parse(widget.startime.split(':')[0]);
                    // if ((widget.endtime.split(":")[1] == '55' &&
                    //         currentminute <= 55 &&
                    //         currenthour == slothour) &&
                    //     ((widget.endtime.split(":")[1] == '25' &&
                    //         currentminute <= 25 &&
                    //         currenthour + 1 == slothour))) {
                      final image = await ImagePicker().pickImage(
                          source: ImageSource.camera,
                          preferredCameraDevice: CameraDevice.front);
                      if (image == null) {
                        return;
                      }
                        isLoading = true;
                      setState(() {});
                      await markAttendance(
                          userProvider.user.email,userProvider.user.courseId, image, context);
                       isLoading = false;
                      setState(() {});
                    // } else {
                    //   Fluttertoast.showToast(
                    //       msg: "Attendance is currently disabled");
                    // }
                  } on PlatformException catch (e) {
                    Fluttertoast.showToast(
                        msg: "Please give necessary permissions");
                  }
                })
          ]),
        ),]
      ),
    );
  }
}
