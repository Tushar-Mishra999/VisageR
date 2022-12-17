import 'package:facialrecognition_attendance/constants.dart';
import 'package:facialrecognition_attendance/models/student_course.dart';
import 'package:facialrecognition_attendance/screens/feature/student/trial.dart';
import 'package:facialrecognition_attendance/screens/home/home_screen.dart';
import 'package:facialrecognition_attendance/services/fetch_courses.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../components/course_card.dart';
import '../../../components/drawer_tile.dart';
import '../../../provider/user_provider.dart';

class StudentHomePage extends StatefulWidget {
  const StudentHomePage({Key? key}) : super(key: key);

  @override
  State<StudentHomePage> createState() => _StudentHomePageState();
}

class _StudentHomePageState extends State<StudentHomePage> {
  List<StudentCourse> courses = [];

  @override
  void initState() {
    super.initState();
    fetch();
  }

  fetch() async {
    courses = await fetchStudentCourses(context);
    setState(() {});
    return;
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: FutureBuilder(
            future: fetchStudentCourses(context),
            builder: (context, snapshot) => snapshot.hasData
                ? SingleChildScrollView(
                    child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text("Hello,",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.w800)),
                            ),
                            IconButton(
                                onPressed: () async {
                                  await FirebaseAuth.instance.signOut();
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const HomeScreen()),
                                      (route) => false);

                                  // Navigator.pushAndRemoveUntil(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) =>
                                  //             const TrialScreen()),
                                  //     (route) => false);
                                },
                                icon: Icon(
                                  Icons.logout_outlined,
                                  color: khomecolor,
                                ))
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(userProvider.user.name,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w800)),
                        ),
                        GridView.builder(
                            shrinkWrap: true,
                            itemCount: courses.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: 0.9, crossAxisCount: 2),
                            itemBuilder: (context, index) {
                              return CourseCard(
                                coursename: courses[index].coursecode,
                                courseId: courses[index].courseid,
                                startime: courses[index].starttime,
                                endtime: courses[index].endtime,
                                batch: courses[index].batch,
                              );
                            })
                      ],
                    ),
                  ))
                : const Center(
                    child: CircularProgressIndicator(
                        backgroundColor: Colors.purple),
                  )),
      ),
    );
  }
}
