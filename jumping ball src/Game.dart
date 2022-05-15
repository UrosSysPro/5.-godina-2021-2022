import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jumping_ball/Block.dart';
import 'package:jumping_ball/GravityPlayer.dart';
import 'package:jumping_ball/JetPackPlayer.dart';
import 'package:jumping_ball/JumpPlayer.dart';
import 'package:jumping_ball/Player.dart';


class Game{
  late GameState state;

  late Player player;
  late List<Block> platforms=[];
  late List<Block> obstacles=[];
  late Block limitTop,limitBottom;
  bool shouldReDraw=false;

  int width=800;
  int height=600;

  Random random=new Random();

  Game(){
    state=GameState.menu;
    player=JumpPlayer(100, height/2, 50, 50);
    player.color=Colors.teal;
    limitTop=Block(0, 0, width.toDouble(), 20, Colors.orange);
    limitBottom=Block(0, height-20, width.toDouble(), 20, Colors.orange);
  }
  void update(double delta){
    for(Block block in platforms){
      block.update(delta);
    }
    player.update(delta);
    for(Block block in platforms){
      player.checkBlock(block);
    }
    player.checkBlock(limitTop);
    player.checkBlock(limitBottom);
    shouldReDraw=true;
  }
  void draw(Canvas canvas,Size size){
    for(Block b in platforms){
      b.draw(canvas,size);
    }
    player.draw(canvas,size);
    limitTop.draw(canvas,size);
    limitBottom.draw(canvas,size);
  }

}

enum GameState{
  menu,
  pause,
  running
}