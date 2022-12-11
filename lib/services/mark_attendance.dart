import 'dart:convert';
import 'package:facialrecognition_attendance/constants.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

Future markAttendance(
    String email, int? courseId, XFile? image, BuildContext context) async {
  try {
    var bytes = await image!.readAsBytes();
    String base64Image = base64Encode(bytes);
    var permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Fluttertoast.showToast(msg: 'Location Permission Denied');
        return;
      }
    }

    final currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);

    double distanceInMeters = 0;
    distanceInMeters = Geolocator.distanceBetween(
      roomLatitude,
      roomLongitude,
      currentPosition.latitude,
      currentPosition.longitude,
    );

    Fluttertoast.showToast(msg: "DIstance is $distanceInMeters");
    if (distanceInMeters / 1000 < 0.5) {
      Fluttertoast.showToast(
          msg: "Location outside of B-block",
          toastLength: Toast.LENGTH_LONG,
          backgroundColor: Colors.purple);
      return;
    }

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
          msg: "Attendance marked",
          toastLength: Toast.LENGTH_LONG,
          backgroundColor: Colors.purple);
    } else if (res.statusCode == 401) {
      Fluttertoast.showToast(
          msg: "Face not recognised",
          toastLength: Toast.LENGTH_LONG,
          backgroundColor: Colors.purple);
    } else if (res.statusCode == 403) {
      Fluttertoast.showToast(
          msg: "Attendance is currently disabled",
          toastLength: Toast.LENGTH_LONG,
          backgroundColor: Colors.purple);
    } else {
      Fluttertoast.showToast(msg: "Something went wrong please retry");
    }
  } catch (e) {
    Fluttertoast.showToast(msg: e.toString());
  }
}
