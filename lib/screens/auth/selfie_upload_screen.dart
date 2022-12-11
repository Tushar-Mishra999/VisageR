import 'package:facialrecognition_attendance/components/rounded_button.dart';
import 'package:facialrecognition_attendance/services/upload_selfie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../provider/user_provider.dart';

class SelfieUpload extends StatefulWidget {
  SelfieUpload({Key? key}) : super(key: key);

  @override
  State<SelfieUpload> createState() => _SelfieUploadState();
}

class _SelfieUploadState extends State<SelfieUpload> {
  XFile? image;
  //imageFile;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    return Scaffold(
        backgroundColor: Colors.black,
        body: image == null
                ? Center(
                    child: RoundedButton(
                        title: 'Take selfie',
                        size: size,
                        func: () async {
                          try {
                            image = (await ImagePicker().pickImage(
                                source: ImageSource.camera,
                                preferredCameraDevice: CameraDevice.front));
                            if (image == null) {
                              return;
                            }
                            var length = await image!.length();
                            if (length > 3670016) {
                              Fluttertoast.showToast(
                                  msg: "Image size is too big.Please retry",toastLength: Toast.LENGTH_LONG,
          backgroundColor: Colors.purple);
                              return;
                            }
                            setState(() {});
                          } on PlatformException catch (e) {
                            Fluttertoast.showToast(
                                msg: "Please give necessary permissions",toastLength: Toast.LENGTH_LONG,
          backgroundColor: Colors.purple);
                          }
                        }))
                : Stack(
                    children: [
                      if (isLoading)
                        const Center(
                            child: CircularProgressIndicator(
                          color: Colors.purple,
                        )),
                      Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundedButton(
                                  title: 'Retake selfie',
                                  size: size,
                                  func: () async {
                                    try {
                                      image = await ImagePicker().pickImage(
                                          source: ImageSource.camera,
                                          preferredCameraDevice:
                                              CameraDevice.front);
                                      if (image == null) {
                                        return;
                                      }
                                    } on PlatformException catch (e) {
                                      Fluttertoast.showToast(
                                          msg:
                                              "Please give necessary permissions");
                                    }
                                  }),
                              SizedBox(
                                height: size.height * 0.05,
                              ),
                              RoundedButton(
                                  title: 'Upload selfie',
                                  size: size,
                                  func: () async {
                                    isLoading = true;
                                    setState(() {});
                                    await uploadSelie(userProvider.user.name,
                                        userProvider.user.email, image,context);
                                    isLoading = false;
                                    setState(() {});
                                  })
                            ]),
                      ),
                    ],
                  ));
  }
}
