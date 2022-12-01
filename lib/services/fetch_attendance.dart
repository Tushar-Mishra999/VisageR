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
          'https://4ckwzkvhc1.execute-api.us-east-1.amazonaws.com/default/show_attendance?snu_id=$email&course_id=$courseId'),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    final jsonData = json.decode(res.body) as List;
    List<Attendance> products = [];
    if (res.statusCode == 200) {
      return products;
    } else {
      Fluttertoast.showToast(msg: "Something went wrong please retry");
    }
  } catch (e) {
    Fluttertoast.showToast(msg: e.toString());
  }
}
