import 'dart:ui';

import 'package:facialrecognition_attendance/screens/feature/student/student_feature.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => StudentFeature()));
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
                    "CSD 462",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
                  Center(
                    child: Text(
                      "2:00-3:00",
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
