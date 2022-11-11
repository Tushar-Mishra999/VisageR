import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

Future markAttendance(String email, XFile? image, BuildContext context) async {
  try {
    var bytes = await image!.readAsBytes();
    String base64Image = base64Encode(bytes);

    http.Response res = await http.post(
      Uri.parse(
          'https://epwp6axqva.execute-api.us-east-1.amazonaws.com/default/mark_attendance'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({'snu_id': email, 'image': base64Image}),
    );

    if (res.statusCode == 200) {
      print(jsonDecode(res.body));
      Fluttertoast.showToast(msg: "Uploaded Succesfully");
    } else {
      Fluttertoast.showToast(msg: "Something went wrong please retry");
    }
  } catch (e) {
    Fluttertoast.showToast(msg: e.toString());
  }
}
