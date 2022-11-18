import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

Future markAttendance(
    String email, int? courseId, XFile? image, BuildContext context) async {
  try {
    var bytes = await image!.readAsBytes();
    String base64Image = base64Encode(bytes);

    http.Response res = await http.post(
      Uri.parse(
          'https://epwp6axqva.execute-api.us-east-1.amazonaws.com/default/mark_attendance'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(
          {'snu_id': email, 'course_id': courseId, 'image': base64Image}),
    );

    if (res.statusCode == 200) {
      Fluttertoast.showToast(
          msg: json.decode(res.body)['message'].toString().toUpperCase(),
          toastLength: Toast.LENGTH_LONG,
          backgroundColor: Colors.purple);
    } else {
      Fluttertoast.showToast(msg: "Something went wrong please retry");
    }
  } catch (e) {
    Fluttertoast.showToast(msg: e.toString());
  }
}
