import 'dart:convert';
import 'package:facialrecognition_attendance/models/student_course.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../provider/user_provider.dart';

Future<void> toggleAttendance(BuildContext context, String action,String studentName) async {
  final user = Provider.of<UserProvider>(context, listen: false).user;
  http.Response res = await http.post(
    Uri.parse(
        'https://842w5f1y88.execute-api.us-east-1.amazonaws.com/default/toggle_attendance'),
    headers: {
      'Content-Type': 'application/json',
    },
    body: json.encode(
        {'action': action, 'snu_id': studentName, 'course_id': user.courseId}),
  );

  if (res.statusCode == 200) {
    Fluttertoast.showToast(msg: jsonDecode(res.body),backgroundColor: Colors.purple);
  } else {
    Fluttertoast.showToast(msg: "Please try again",backgroundColor: Colors.purple);
  }
}
