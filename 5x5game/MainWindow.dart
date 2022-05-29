import 'package:flutter/material.dart';
import 'dart:math' as math;

class MainWindow extends StatefulWidget {
  @override
  _MainWindowState createState() => _MainWindowState();
}

class _MainWindowState extends State<MainWindow> with SingleTickerProviderStateMixin {

  int size=5;
  late List<List<int>> mat;
  bool didMove=false;

  int selectedRow=-10;
  int selectedColumn=-10;
  double offset=0;

  late AnimationController controller;

  @override
  void initState() {

    super.initState();
    mat=[];
    for(int i=0;i<size;i++){
      mat.add([]);
      for(int j=0;j<size;j++){
        mat[i].add(i+j*size+1);
      }
    }
    controller=new AnimationController(
        vsync: this,
        duration:Duration(seconds: 1)
    );
    controller.value=1;
    controller.addStatusListener((status) {
      if(status==AnimationStatus.dismissed){
        setState((){
          selectedRow=-10;
          selectedColumn=-10;
          controller.value=1;
        });
      }
    });
    controller.addListener(() {setState((){

    });});

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(

          onHorizontalDragStart: (args){
            selectedRow = (args.localPosition.dy/100).toInt();
            offset=0;
          },
          onHorizontalDragUpdate: (args){
            setState(() {
              offset+=args.delta.dx;
              didMove=true;
            });

          },
          onHorizontalDragEnd: (args){
            setState((){
              int toMove=(offset/100).round();
              List<int> noviRed=[];
              int j=selectedRow;
              for(int i=0;i<size;i++){
                int novoI=i-toMove;
                if(novoI<0)novoI=size+novoI;
                if(novoI>=size)novoI%=size;
                noviRed.add(mat[novoI][j]);
              }
              for(int i=0;i<size;i++)
                mat[i][j]=noviRed[i];

              offset=offset-((offset/100).round()*100);
              double from=(100-offset)/100;
              controller.reverse(from: from);
            });

          },
          onVerticalDragStart: (args){
            setState((){
              selectedColumn = (args.localPosition.dx/100).toInt();
              offset=0;
            });
          },
          onVerticalDragUpdate: (args){
            setState(() {
              offset+=args.delta.dy;
              didMove=true;
            });

          },
          onVerticalDragEnd: (args){
            setState((){
              int toMove=(offset/100).round();
              List<int> novaKolona=[];
              int i=selectedColumn;
//              print(i);
              for(int j=0;j<size;j++){
                int novoJ=j-toMove;
                if(novoJ<0)novoJ=size+novoJ;
                if(novoJ>=size)novoJ%=size;
                novaKolona.add(mat[i][novoJ]);
                print("novoJ:${novoJ} j:${j}");
              }
              for(int j=0;j<size;j++)
                mat[i][j]=novaKolona[j];
              
              offset=offset-((offset/100).round()*100);
              double from=(100-offset)/100;
              controller.reverse(from: from);
            });

          },
          child: ClipRect(
            child: SizedBox(
              width:500,
              height: 500,
              child: CustomPaint(
                painter: GamePainter(
                    mat,
                    didMove,
                    selectedRow,
                    selectedColumn,
                    offset,
                    controller
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


class GamePainter extends CustomPainter{

  bool didMove=false;
  List<List<int>> mat;
  int selectedRow;
  int selectedColumn;
  double offset;
  AnimationController controller;

  GamePainter(
      this.mat,
      this.didMove,
      this.selectedRow,
      this.selectedColumn,
      this.offset,
      this.controller);

  @override
  void paint(Canvas canvas, Size size) {
    int cellWidth=(size.width/mat.length).toInt();
    int cellHeight=(size.height/mat[0].length).toInt();

    Paint p=Paint();
    p.style=PaintingStyle.fill;

    for(int i=-mat.length;i<mat.length*2;i++){
      for(int j=-mat[0].length;j<mat[0].length*2;j++){
        int q=i%mat.length;
        int w=j%mat.length;

        int size=mat.length;
        int x=(mat[q][w]-1)%size;
        int y=((mat[q][w]-1)/size).toInt();

        int r=(255/mat.length*x).toInt();
        int g=(255/mat[0].length*y).toInt();
        int b=120;
        p.color=Color.fromARGB(255, r, g, b);

        double l=i*cellWidth.toDouble();
        double t=j*cellHeight.toDouble();

        if(selectedColumn==i)t+=offset*controller.value;
        if(selectedRow==j)l+=offset*controller.value;

        canvas.drawRect(
            Rect.fromLTWH(
                l,
                t,
                cellWidth.toDouble(),
                cellHeight.toDouble(),
            ), p);
      }
    }

  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return didMove;
  }
}