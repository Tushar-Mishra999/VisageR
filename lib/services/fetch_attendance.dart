import 'package:facialrecognition_attendance/models/attendance.dart';
import 'package:facialrecognition_attendance/screens/feature/student/student_view_attendance.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../provider/user_provider.dart';

Future fetchAttendance(BuildContext context) async {
  try {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final email = userProvider.user.email;
    final courseId = userProvider.user.courseId;
    http.Response res = await http.get(
      Uri.parse(
          'https://4ckwzkvhc1.execute-api.us-east-1.amazonaws.com/default/show_attendance?snu_id=$email&course_id=$courseId&type=admin'),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    final jsonData = json.decode(res.body);
    List<Attendance> students = [];
    jsonData.forEach((k, v) {
      List body = jsonData[k] as List;
      int present = 0;
      int absent = 0;
      for (var element in body) {
        if (element["status"]) {
          present++;
        } else {
          absent++;
        }
      }
      int percentage = (present ~/ (present + absent)).toInt() * 100;
      Attendance student = Attendance(name: k, percentage: percentage);
      students.add(student);
    });
    
    if (res.statusCode == 200) {
      return students;
    } else {
 Fluttertoast.showToast(msg:'Something went wrong, please try again',toastLength: Toast.LENGTH_LONG,
          backgroundColor: Colors.purple);
    }
  } catch (e) {
    Fluttertoast.showToast(msg: e.toString());
  }
}
