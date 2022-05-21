import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jumping_ball/Block.dart';
import 'package:jumping_ball/GravityPlayer.dart';
import 'package:jumping_ball/JetPackPlayer.dart';
import 'package:jumping_ball/JumpPlayer.dart';
import 'package:jumping_ball/Player.dart';
import 'package:jumping_ball/levelPart.dart';


class Game{

  double score=1;
  late GameState state;

  late Player player;

  List<LevelPart> parts=[];

  late Block limitTop,limitBottom;
  bool shouldReDraw=false;

  int width=800;
  int height=600;

  Random random=new Random();

  Game(){
    state=GameState.menu;
    player=GravityPlayer(100, height/2, 50, 50);
    player.color=Colors.teal;

    parts.add(LevelPart(player,width,height,random));
    parts.add(LevelPart(player,width+300,height,random));
    parts.add(LevelPart(player,width+600,height,random));

    limitTop=Block(0, 0, width.toDouble(), 20, Colors.orange);
    limitBottom=Block(0, height-20, width.toDouble(), 20, Colors.orange);
  }
  void update(double delta){
    score+=delta/100;
    delta*=score;


    player.update(delta);
    for(int i=0;i<parts.length;i++){
      if(parts[i].update(delta,player)){
        state=GameState.gameOver;
      }
      if(parts[i].hasLeftScreen()){
        parts[i]=LevelPart(player,width,height,random);
      }
    }
    
    player.checkBlock(limitTop);
    player.checkBlock(limitBottom);
    shouldReDraw=true;
  }
  void draw(Canvas canvas,Size size){
    for(LevelPart part in parts){
      part.draw(canvas,size);
    }
    player.draw(canvas,size);
    limitTop.draw(canvas,size);
    limitBottom.draw(canvas,size);
  }

}

enum GameState{
  menu,
  pause,
  running,
  gameOver
}