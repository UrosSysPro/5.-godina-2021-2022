import 'package:flutter/material.dart';
import 'package:jumping_ball/Block.dart';
import 'package:jumping_ball/GravityPlayer.dart';
import 'package:jumping_ball/Player.dart';


class Game{
  late GameState state;

  late Player player;
  late List<Block> platforms=[];
  late List<Block> obstacles=[];
  bool shouldReDraw=false;

  int width=800;
  int height=600;

  Game(){
    state=GameState.menu;
    player=GravityPlayer(100, height/2, 50, 50);
    player.color=Colors.teal;
    platforms.add(Block(0, 0, width.toDouble(), 20, Colors.orange));
    platforms.add(Block(0, height-20, width.toDouble(), 20, Colors.orange));
  }
  void update(double delta){
    for(Block block in platforms){
      block.update(delta);
    }
    player.update(delta);
    for(Block block in platforms){
      player.checkBlock(block);
    }
    shouldReDraw=true;
  }
  void draw(Canvas canvas,Size size){
    for(Block b in platforms){
      b.draw(canvas,size);
    }
    player.draw(canvas,size);
  }

}

enum GameState{
  menu,
  pause,
  running
}