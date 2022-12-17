import 'package:facialrecognition_attendance/models/attendance.dart';
import 'package:facialrecognition_attendance/services/fetch_attendance.dart';
import 'package:flutter/material.dart';

import '../../../components/attendance_card.dart';
import '../../../components/enable_button.dart';

class AdminFeature extends StatefulWidget {
  const AdminFeature({Key? key}) : super(key: key);

  @override
  State<AdminFeature> createState() => _AdminFeatureState();
}

class _AdminFeatureState extends State<AdminFeature> {
  bool isLoaded = false;
  @override
  void initState() {
    super.initState();
    fetch();
  }

  fetch() async {
    students = await fetchAttendance(context);
    isLoaded = true;
    setState(() {});
    return;
  }

  List<Attendance> students = [];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: !isLoaded
              ? const Center(
                  child: CircularProgressIndicator(
                  color: Colors.purple,
                ))
              : Column(
                mainAxisSize: MainAxisSize.min,
               children: [
                SizedBox(
                  height: size.height * 0.06,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    EnableCard(
                        size: size,
                        title: "Enable",
                        color: const Color(0xFF0FFF50)),
                    SizedBox(
                      width: size.width * 0.1,
                    ),
                    EnableCard(
                        size: size, title: "Disable", color: Colors.red)
                  ],
                ),
                 SizedBox(
                      height: size.height * 0.1,
                    ),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                          itemCount: students.length,
                          itemBuilder: (context, index) {
                            return AttendanceCard(
                              size: size,
                              name: students[index].name,
                              percentage: students[index].percentage,
                            );
                          }),
                    ),
              ],
                ),
        ));
  }
}
