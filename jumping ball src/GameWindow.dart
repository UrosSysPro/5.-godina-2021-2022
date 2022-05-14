import 'package:flutter/material.dart';
import 'package:jumping_ball/Game.dart';

class GameWindow extends StatefulWidget {
  const GameWindow({ Key? key }) : super(key: key);

  @override
  _GameWindowState createState() => _GameWindowState();
}

class _GameWindowState extends State<GameWindow> with SingleTickerProviderStateMixin {
  Game game=Game();

  late AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller=AnimationController(
      vsync: this,
      duration: Duration(seconds: 100),
    );
    controller.addListener(() {setState((){
      game.update();
//      print("ee");
    });});
    controller.forward();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget w=Container();
    
    switch(game.state){
      case GameState.menu:w=displayMenu();break;
      case GameState.running:w=displayGame();break;
      case GameState.pause:w=displayPauseMenu();break;
    }
    return w;
  }

  Widget displayGame(){
    return CustomPaint(
      painter: GamePainter(game),
    );
  }

  Widget displayMenu(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        createMenuButton("Start", () {setState(() {
          game.state=GameState.running;
        }); }),
        createMenuButton("Quit", () { }),
      ],
    );
  }
  Widget createMenuButton(String text,VoidCallback callback){
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: ElevatedButton(
        onPressed: callback,
        child: SizedBox(
          width: 200,
          child: Center(child: Text(text)),
        ),
      ),
    );
  }

  Widget displayPauseMenu(){
    return Container();
  }

}


class GamePainter extends CustomPainter{

  Game game;

  GamePainter(this.game);

  @override
  void paint(Canvas canvas, Size size) {

    var paint=Paint();
    paint.color=game.player.color;
    paint.style=PaintingStyle.fill;
    double l=game.player.x;
    double t=game.player.y;
    double r=l+game.player.width;
    double b=t+game.player.height;
    canvas.drawRect(Rect.fromLTRB(l,t,r,b), paint);

    for(int i=0;i<game.platforms.length;i++){
      l=game.platforms[i].x;
      t=game.platforms[i].y;
      r=game.platforms[i].width+l;
      b=game.platforms[i].height+t;
      paint.color=game.platforms[i].color;
      canvas.drawRect(Rect.fromLTRB(l,t,r,b), paint);
    }


  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}