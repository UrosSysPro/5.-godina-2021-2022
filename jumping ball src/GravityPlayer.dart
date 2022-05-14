import 'package:flutter/material.dart';
import 'package:jumping_ball/Block.dart';
import 'package:jumping_ball/Player.dart';

class GravityPlayer extends Player{

  late double ay,vy;
  double maxSpeed=240;
  

  GravityPlayer(
    double x,
    double y,
    double width,
    double height
    ):super(x,y,width,height){
    ay=-240;
    vy=0;
  }
  @override
  void update(double delta) {
    vy+=ay*delta;
    if(vy>maxSpeed)vy=maxSpeed;
    if(vy<-maxSpeed)vy=-maxSpeed;
    y+=vy*delta;
  }
  @override
  void input() {
    ay=-ay;
  }
  @override
  void checkBlock(Block block){
    if(
      block.y+block.height<y||
      block.x>x+width||
      block.y>y+height||
      block.x+block.width<x
      )return;
    double cp=y+height/2;
    double cb=block.y+block.height/2;
    if(cp<cb){
      y=block.y-height;
    }else{
      y=block.y+block.height;
    }
    vy=0;
  }
  @override
  void draw(Canvas canvas,Size size){
    var paint=Paint();
    paint.color=color;
    paint.style=PaintingStyle.fill;
    double l=x;
    double t=y;
    double r=l+width;
    double b=t+height;
    canvas.drawRect(Rect.fromLTRB(l,t,r,b), paint);
  }
}