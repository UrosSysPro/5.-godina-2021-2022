import 'package:flutter/material.dart';

class Block{
  late double x,y,width,height;

  late Color color;
  Block(this.x,this.y,this.width,this.height,this.color);
  double vx=-100;

  void update(double delta){
    x+=vx*delta;
  }

  void draw(Canvas canvas,Size size){
      var paint=Paint();
      paint.color=color;
      paint.style=PaintingStyle.fill;
      double l=x;
      double t=y;
      double r=width+l;
      double b=height+t;
      
      canvas.drawRect(Rect.fromLTRB(l,t,r,b), paint);
  }
}