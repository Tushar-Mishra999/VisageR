import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton(
      {Key? key, required this.title, required this.size, required this.func})
      : super(key: key);

  final size;
  final title;
  final func;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
      child: Container(
          width: size.width * 0.8,
          height: size.height * 0.1,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [Colors.blueAccent, Colors.purple],
              ),
              borderRadius: BorderRadius.all(Radius.circular(30))),
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                  fontSize: 20, fontWeight: FontWeight.w900, color: Colors.white),
            ),
          )),
    );
  }
}
