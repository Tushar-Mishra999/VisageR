import 'dart:convert';
import 'package:facialrecognition_attendance/models/student_course.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../provider/user_provider.dart';

Future enableAttendance(BuildContext context, String action) async {
  final userProvider = Provider.of<UserProvider>(context, listen: false);
  final response = await http.get(Uri.parse(
      "https://agay56his9.execute-api.us-east-1.amazonaws.com/default/enableDisable?action=$action&course_id=${userProvider.user.courseId}"));
  if (response.statusCode == 200) {
    Fluttertoast.showToast(msg: "Attendance ${action}d",toastLength: Toast.LENGTH_LONG,
          backgroundColor: Colors.purple);
  } else {
    Fluttertoast.showToast(msg:'Something went wrong, please try again',toastLength: Toast.LENGTH_LONG,
          backgroundColor: Colors.purple);
  }
}
