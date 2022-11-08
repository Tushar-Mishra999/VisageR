import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

Future<void> uploadSelie(
    String username, String email, dynamic imageFile) async {
  try {
    http.Response res = await http.post(
      Uri.parse(
          'https://kf6mue8kw2.execute-api.us-east-1.amazonaws.com/default/register/admin/delete-product'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({'name': username, 'snu_id': email, 'image': imageFile}),
    );
  } catch (e) {
    Fluttertoast.showToast(msg: e.toString());
  }
}
