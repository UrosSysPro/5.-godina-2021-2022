import 'package:flutter/material.dart';
import 'package:jumping_ball/Block.dart';
import 'package:jumping_ball/GravityPlayer.dart';
import 'package:jumping_ball/Player.dart';


class Game{
  late GameState state;

  late Player player;
  late List<Block> platforms=[];
  late List<Block> obstacles=[];

  int width=800;
  int height=600;

  Game(){
    state=GameState.menu;
    player=GravityPlayer(100, height/2, 50, 50);
    player.color=Colors.teal;
    platforms.add(Block(0, 0, width.toDouble(), 20, Colors.orange));
    platforms.add(Block(0, height-20, width.toDouble(), 20, Colors.orange));
  }
  update(){
    player.update();
    for(Block block in platforms){
      player.checkBlock(block);
    }
  }
}

enum GameState{
  menu,
  pause,
  running
}