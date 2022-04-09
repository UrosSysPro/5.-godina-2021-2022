import 'package:flutter/material.dart';
import 'package:simpleflutterproject/Task.dart';

class TaskWidget extends StatefulWidget {

  final Task task;

  const TaskWidget(this.task,{ Key? key }) : super(key: key);

  @override
  _TaskWidgetState createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {

  double offset=0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (details){
        setState((){
          offset+=details.delta.dx;
        });
      },
      child: Stack(
        children:[
          Positioned(
            left: 0,right:0,top:0,bottom:0,
            child:Container(color:Colors.red)
          ),
          Transform.translate(
            offset: Offset(offset,0),
            child: Container(
              color: Colors.white,
              child:Padding(
                padding: const EdgeInsets.only(left:10,right:10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.task.name),
                    Switch(value:widget.task.done,onChanged:(value){
                      setState((){
                        widget.task.done=value;
                      });
                    })
                  ],
                ),
              )
            ),
          )
        ]
      ),
    );
  }
}