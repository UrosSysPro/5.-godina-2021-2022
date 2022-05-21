import 'package:flutter/material.dart';
import 'package:jumping_ball/GameWindow.dart';

void main(){
  runApp(MaterialApp(
    theme: ThemeData.dark(),
    debugShowCheckedModeBanner: false,
    title: "game",
    home:GameWindow()
  ));
}
