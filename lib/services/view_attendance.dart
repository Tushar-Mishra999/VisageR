import 'package:facialrecognition_attendance/screens/feature/student/student_view_attendance.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../provider/user_provider.dart';

Future viewAttendance(BuildContext context) async {
  try {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final email = userProvider.user.email;
    final courseId = userProvider.user.courseId;
    http.Response res = await http.get(
      Uri.parse(
          'https://4ckwzkvhc1.execute-api.us-east-1.amazonaws.com/default/show_attendance?snu_id=$email&course_id=$courseId&type=student'),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    final jsonData = json.decode(res.body) as List;
    double present = 0;
    double absent = 0;
    for (var x in jsonData) {
      if (x["status"]) {
        present++;
      } else {
        absent++;
      }
    }
    Map<String, double> mp = {};
    mp["present"] = present;
    mp["absent"] = absent;
    if (res.statusCode == 200) {
      return mp;
    } else {
      Fluttertoast.showToast(msg:'Something went wrong, please try again',toastLength: Toast.LENGTH_LONG,
          backgroundColor: Colors.purple);
    }
  } catch (e) {
    Fluttertoast.showToast(msg: e.toString(),toastLength: Toast.LENGTH_LONG,
          backgroundColor: Colors.purple);
  }
}
