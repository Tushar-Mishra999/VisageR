import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'components/rounded_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: SvgPicture.asset(
                "assets/gradhatns.svg",
                width: size.width * 0.6,
              ),
            ),
            SizedBox(
              height: size.height * 0.07,
            ),
            RoundedButton(title:"LOGIN",size: size,func: (){},),
            SizedBox(
              height: size.height * 0.01,
            ),
            RoundedButton(title:"SIGNUP",size: size,func: (){},),
          ],
        ),
      ),
    );
  }
}


