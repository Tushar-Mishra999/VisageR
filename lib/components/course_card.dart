import 'dart:ui';

import 'package:facialrecognition_attendance/screens/feature/student/student_feature.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../constants.dart';

class CourseCard extends StatelessWidget {
  const CourseCard(
      {Key? key,
      required this.coursename,
      required this.startime,
      required this.endtime,
      required this.batch})
      : super(key: key);
  final String coursename;
  final String startime;
  final String endtime;
  final String batch;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        int currenthour = DateTime.now().hour;
        int currentminute = DateTime.now().minute;
        int slothour = int.parse(startime.split(':')[0]);
        if ((endtime.split(":")[1] == '55' && currentminute<=55 && currenthour == slothour) &&
            ((endtime.split(":")[1] == '25'&& currentminute<=25 && currenthour + 1 == slothour))) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => StudentFeature()));
        } else {
          Fluttertoast.showToast(msg: "Attendance is currently disabled");
        }
      },
      child: Container(
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.all(5),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 100.0,
              sigmaY: 100.0,
            ),
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                  color: khomecolor.withOpacity(0.3),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  border: Border.all(
                    width: 5,
                    color: khomecolor.withOpacity(0.8),
                  )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                      child: Text(
                    "${coursename}-${batch}",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
                  Center(
                    child: Text(
                      "$startime-$endtime",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
