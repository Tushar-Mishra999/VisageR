import 'dart:convert';

import 'package:facialrecognition_attendance/models/student_course.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../provider/user_provider.dart';

fetchStudentCourses(BuildContext context) async {
  final user = Provider.of<UserProvider>(context, listen: false).user;
  final response = await http.get(Uri.parse(
      "https://jntu7ibenk.execute-api.us-east-1.amazonaws.com/default/get_classes?snu_id=${user.email}"));
  if (response.statusCode == 200) {
    List<StudentCourse> courses = (json.decode(response.body) as List)
        .map((data) => StudentCourse.fromJson(data))
        .toList();
    return courses;
  } else {
    throw Exception('Failed to load');
  }
}
