import 'package:facialrecognition_attendance/constants.dart';
import 'package:flutter/material.dart';

class AttendanceCard extends StatelessWidget {
  const AttendanceCard(
      {Key? key,
      required this.size,
      required this.name,
      required this.percentage})
      : super(key: key);

  final Size size;
  final String name;
  final int percentage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
          width: size.width * 0.8,
          height: size.height * 0.07,
          decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                width: 4,
                color: khomecolor,
              ),
              boxShadow: [
                BoxShadow(
                  color: khomecolor,
                  blurRadius: 15.0,
                  spreadRadius: 2.0,
                  offset: const Offset(
                    0.0,
                    3.0,
                  ),
                ),
              ]),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ),
                Text(
                  "$percentage%",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                )
              ],
            ),
          )),
    );
  }
}
