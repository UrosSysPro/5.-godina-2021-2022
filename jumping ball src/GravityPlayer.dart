import 'package:jumping_ball/Block.dart';
import 'package:jumping_ball/Player.dart';

class GravityPlayer extends Player{

  late double ay,vy;
  

  GravityPlayer(
    double x,
    double y,
    double width,
    double height
    ):super(x,y,width,height){
    ay=0;
    vy=1;
  }
  @override
  void update() {
    vy+=ay;
    y+=vy;
  }
  @override
  void input(InputInfo info) {
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
    y=block.y-height;
    vy=0;
  }
}