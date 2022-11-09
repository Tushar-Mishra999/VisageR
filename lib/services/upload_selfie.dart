import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

Future<void> uploadSelie(String username, String email, XFile? image) async {
  try {
    // http.Response res = await http.post(
    //   Uri.parse(
    //       'https://kf6mue8kw2.execute-api.us-east-1.amazonaws.com/default/register'),
    //   headers: {
    //     'Content-Type': 'application/json',
    //   },
    //   body: json.encode({'name': username, 'snu_id': email, 'image': image}),
    // );
    // Fluttertoast.showToast(msg: res.body);

    // var headers = {'Content-Type': 'application/json'};
    // var request = http.MultipartRequest(
    //     'POST',
    //     Uri.parse(
    //         'https://kf6mue8kw2.execute-api.us-east-1.amazonaws.com/default/register'));
    // request.fields.addAll({
    //   "name": username,
    //   "snu_id": email,
    // });
    // request.headers.addAll(headers);
    // request.files.add(await http.MultipartFile.fromPath('image', image!.path));
    // http.StreamedResponse res = await request.send();
    // print("hello");
    // print(res);
    // Fluttertoast.showToast(msg: res.statusCode.toString());

    var stream = http.ByteStream(image!.openRead());
    stream.cast();

    var length = await image.length();
    var uri = Uri.parse(
        'https://kf6mue8kw2.execute-api.us-east-1.amazonaws.com/default/register');

    var request = http.MultipartRequest('POST', uri);
    request.fields['name'] = username; //username
    request.fields['snu_id'] = email; //email

    var multiport = http.MultipartFile('image', stream, length); //image

    request.files.add(multiport);
    var res = await request.send();
    if (res.statusCode == 200) {
      Fluttertoast.showToast(msg: "Uploaded Succesfully");

      await FirebaseFirestore.instance
          .collection('users')
          .doc(email)
          .update({"isSelfieUploaded": true});
    } else {
      Fluttertoast.showToast(msg: "Something went wrong please retry");
    }
  } catch (e) {
    Fluttertoast.showToast(msg: e.toString());
  }
}

