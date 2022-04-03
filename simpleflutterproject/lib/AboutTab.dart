import 'package:flutter/material.dart';

class AboutTab extends StatelessWidget {
  const AboutTab({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FlutterLogo(),
        Text("To Do App Flutter v0.1"),
        Text("System Pro tm")
      ],
    );
  }
}