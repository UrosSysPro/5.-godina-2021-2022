import 'package:jumping_ball/Block.dart';
import 'package:jumping_ball/Player.dart';
import 'package:jumping_ball/JumpPlayer.dart';
import 'package:jumping_ball/JetPackPlayer.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class LevelPart{
  List<Block> platforms=[];
  List<Block> obstacles=[];
  LevelPart(Player p,int w,int h,Random random){
    if(p is JumpPlayer){
      int r=random.nextInt(h);
      obstacles.add(Block(w.toDouble(),0,100,r.toDouble(),Colors.red));
      obstacles.add(Block(w.toDouble(),r+200,100,h-r.toDouble()-200,Colors.red));
    }
  }
  bool update(double delta,Player p){
    for(Block b in platforms){
      b.x-=100*delta;
    }
    for(Block b in obstacles){
      b.x-=100*delta;
    }
    for(Block b in platforms){
      p.checkBlock(b);
    }
    for(Block block in obstacles){
      if(
        block.y+block.height<p.y||
      block.x>p.x+p.width||
      block.y>p.y+p.height||
      block.x+block.width<p.x
      )return true;
    }


    return false;
  }
}