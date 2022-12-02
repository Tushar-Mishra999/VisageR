import 'package:facialrecognition_attendance/services/enable_attendance.dart';
import 'package:flutter/material.dart';

class EnableCard extends StatelessWidget {
  const EnableCard({
    Key? key,
    required this.size,
    required this.title,
    required this.color,
  }) : super(key: key);

  final Size size;
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        enableAttendance(
          context,title.toLowerCase()
        );
      },
      child: Container(
        width: size.width * 0.4,
        height: size.height * 0.05,
        child: Center(
          child: Text(
            title,
            style: TextStyle(color: color, fontSize: 20),
          ),
        ),
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: const BorderRadius.all(
              Radius.circular(15),
            ),
            boxShadow: [
              BoxShadow(
                color: color,
                blurRadius: 10.0,
                spreadRadius: 2.0,
                offset: const Offset(
                  0.0,
                  3.0,
                ),
              ),
            ],
            border: Border.all(color: color, width: 3)),
      ),
    );
  }
}
