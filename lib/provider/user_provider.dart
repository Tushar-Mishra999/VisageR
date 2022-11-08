import 'package:facialrecognition_attendance/models/user.dart';
import 'package:flutter/material.dart';
class UserProvider extends ChangeNotifier {
  User _user = User(
    name: '',
    email: '',
  );

  User get user => _user;

  void setUser(Map<String, dynamic> user) {
    _user = User.fromJson(user);
    notifyListeners();
  }

}
