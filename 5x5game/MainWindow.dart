import 'package:flutter/material.dart';
import 'dart:math' as math;

class MainWindow extends StatefulWidget {
  @override
  _MainWindowState createState() => _MainWindowState();
}

class _MainWindowState extends State<MainWindow> {

  int size=5;
  late List<List<int>> mat;
  bool didMove=false;

  int selectedRow=-1;
  int selectedColumn=-1;
  double offset=0;

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
              selectedRow=-1;
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
              selectedColumn=-1;
            });

          },
          child: SizedBox(
            width:500,
            height: 500,
            child: CustomPaint(
              painter: GamePainter(
                  mat,
                  didMove,
                  selectedRow,
                  selectedColumn,
                  offset
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

  GamePainter(
      this.mat,
      this.didMove,
      this.selectedRow,
      this.selectedColumn,
      this.offset);

  @override
  void paint(Canvas canvas, Size size) {
    int cellWidth=(size.width/mat.length).toInt();
    int cellHeight=(size.height/mat[0].length).toInt();

    Paint p=Paint();
    p.style=PaintingStyle.fill;

    for(int i=0;i<mat.length;i++){
      for(int j=0;j<mat[0].length;j++){
        int size=mat.length;
        int x=(mat[i][j]-1)%size;
        int y=((mat[i][j]-1)/size).toInt();

        int r=(255/mat.length*x).toInt();
        int g=(255/mat[0].length*y).toInt();
        int b=120;
        p.color=Color.fromARGB(255, r, g, b);

        double l=i*cellWidth.toDouble();
        double t=j*cellHeight.toDouble();

        if(selectedColumn==i)t+=offset;
        if(selectedRow==j)l+=offset;

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