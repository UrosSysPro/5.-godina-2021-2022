import 'package:flutter/material.dart';

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
            print(selectedRow);
          },
          onHorizontalDragUpdate: (args){
            setState(() {
              offset+=args.delta.dx;
              didMove=true;
            });

          },
          onHorizontalDragEnd: (args){
            selectedRow=-1;
          },
          onVerticalDragStart: (args){
            selectedColumn = (args.localPosition.dx/100).toInt();
            offset=0;
            print(selectedRow);
          },
          onVerticalDragUpdate: (args){
            setState(() {
              offset+=args.delta.dx;
              didMove=true;
            });

          },
          onVerticalDragEnd: (args){
            selectedColumn=-1;
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
        int r=(255/mat.length*i).toInt();
        int g=(255/mat[0].length*j).toInt();
        int b=120;
        p.color=Color.fromARGB(255, r, g, b);
        int l=i*cellWidth;
        int t=j*cellHeight;
        canvas.drawRect(
            Rect.fromLTWH(
                l.toDouble(),
                t.toDouble(),
                cellWidth.toDouble(),
                cellHeight.toDouble(),
            ), p);
      }
    }

    if(selectedColumn!=-1){
      p.color=Colors.red;
      canvas.drawRect(Rect.fromLTWH(
          (selectedColumn*cellWidth).toDouble(),
          0,
          cellWidth.toDouble(),
          size.height),
      p);
    }
    if(selectedRow !=-1){
      p.color=Colors.red;
      canvas.drawRect(Rect.fromLTWH(
          0,
          (selectedRow*cellHeight).toDouble(),
          size.width,
          cellHeight.toDouble()),
          p);
    }

  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return didMove;
  }
}