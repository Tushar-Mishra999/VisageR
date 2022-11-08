import 'dart:io';

import 'package:facialrecognition_attendance/components/rounded_button.dart';
import 'package:facialrecognition_attendance/services/upload_selfie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../provider/user_provider.dart';

class SelfieUpload extends StatelessWidget {
  SelfieUpload({Key? key}) : super(key: key);
  File? image;
  late final imageFile;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: image == null
            ? Center(
                child: RoundedButton(
                    title: 'Take selfie',
                    size: size,
                    func: () async {
                      try {
                        final image = await ImagePicker().pickImage(
                            source: ImageSource.camera,
                            preferredCameraDevice: CameraDevice.front);
                        if (image == null) {
                          return;
                        }
                        imageFile = File(image.path);
                      } on PlatformException catch (e) {
                        Fluttertoast.showToast(
                            msg: "Please give necessary permissions");
                      }
                    }))
            : Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                RoundedButton(
                    title: 'Retake selfie',
                    size: size,
                    func: () async {
                      try {
                        final image = await ImagePicker().pickImage(
                            source: ImageSource.camera,
                            preferredCameraDevice: CameraDevice.front);
                        if (image == null) {
                          return;
                        }
                        imageFile = File(image.path);
                      } on PlatformException catch (e) {
                        Fluttertoast.showToast(
                            msg: "Please give necessary permissions");
                      }
                    }),
                SizedBox(
                  height: size.height * 0.05,
                ),
                RoundedButton(
                    title: 'Upload selfie',
                    size: size,
                    func: () async {
                      await uploadSelie(userProvider.user.name,userProvider.user.email, imageFile);
                    })
              ]),
      ),
    );
  }
}
