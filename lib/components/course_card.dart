import 'dart:ui';

import 'package:facialrecognition_attendance/screens/feature/student/student_feature.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../provider/user_provider.dart';

class CourseCard extends StatelessWidget {
  const CourseCard(
      {Key? key,
      required this.coursename,
      required this.courseId,
      required this.startime,
      required this.endtime,
      required this.batch})
      : super(key: key);
  final String coursename;
  final String startime;
  final String endtime;
  final String batch;
  final int courseId;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.setCourseId(courseId);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => StudentFeature(
                      startime: startime,
                      endtime: endtime,
                    )));
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
