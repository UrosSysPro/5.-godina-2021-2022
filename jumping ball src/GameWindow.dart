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
  double oldValue=0;

  @override
  void initState() {
    super.initState();

    controller=AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    controller.addListener(() {setState((){
      double delta=controller.value-oldValue;
      game.update(delta);
      oldValue=controller.value;
      
    });});

    controller.addStatusListener((status){
      if(status==AnimationStatus.completed){
        oldValue=0;
        controller.value=0;
        
        controller.forward();
      }
    });

    // controller.forward();
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
    return GestureDetector(
      onTap: (){
        game.player.input();
      },  
      child: CustomPaint(
        painter: GamePainter(game),
      ),
    );
  }

  Widget displayMenu(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        createMenuButton("Start", () {setState(() {
          game.state=GameState.running;
          controller.forward();
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
    game.draw(canvas, size);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    if(game.shouldReDraw){
      game.shouldReDraw=false;
      return true;
    }
    return false;
  }
}