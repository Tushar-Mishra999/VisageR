import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../components/attendance_card.dart';

class AdminFeature extends StatelessWidget {
  const AdminFeature({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
            children: [
              SizedBox(
                height: size.height * 0.06,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  EnableCard(size: size),
                  SizedBox(
                    width: size.width * 0.1,
                  ),
                  Container(
                    width: size.width * 0.4,
                    height: size.height * 0.05,
                    child: Center(
                      child: Text(
                        "Disable",
                        style: TextStyle(color: Colors.red, fontSize: 20),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.red,
                            blurRadius: 10.0,
                            spreadRadius: 2.0,
                            offset: Offset(
                              0.0,
                              3.0,
                            ),
                          ),
                        ],
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        border: Border.all(color: Colors.red, width: 3)),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: size.height * 0.1,
                  ),
                  AttendanceCard(size: size),
                  AttendanceCard(size: size),
                  AttendanceCard(size: size),
                  AttendanceCard(size: size),
                  AttendanceCard(size: size),
                  AttendanceCard(size: size)
                ],
              )
            ],
          )),
        ));
  }
}

class EnableCard extends StatelessWidget {
  const EnableCard({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.4,
      height: size.height * 0.05,
      child: Center(
        child: Text(
          "Enable",
          style:
              TextStyle(color: Color(0xFF0FFF50), fontSize: 20),
        ),
      ),
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.green,
              blurRadius: 10.0,
              spreadRadius: 2.0,
              offset: Offset(
                0.0,
                3.0,
              ),
            ),
          ],
          border: Border.all(color: Color(0xFF0FFF50), width: 3)),
    );
  }
}
