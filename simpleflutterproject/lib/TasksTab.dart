import 'package:flutter/material.dart';
import 'package:simpleflutterproject/Task.dart';

class TasksTab extends StatefulWidget {
  final List<Task> tasks;

  TasksTab(this.tasks);

  @override
  State<TasksTab> createState() => _TasksTabState();
}

class _TasksTabState extends State<TasksTab> {
  double  offset=0;


  @override
  Widget build(BuildContext context) {
    if(widget.tasks.isEmpty){
      return Center(
        child:Text("No tasks, click + to add"),
      );
    }

      

    return ListView(
      children: widget.tasks.asMap().map((i, task) {
        return MapEntry(i,
          GestureDetector(
              onHorizontalDragUpdate: (args){setState((){
                offset+=args.delta.dx;
              });
              },
              child: Stack(
              children:[
                Container(color: Colors.red,),
                Transform.translate(
                    offset: Offset(offset,0),
                    child: Container(
                    color:Colors.white,
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Text(task.name),
                      Switch(
                        value: task.done,
                        onChanged:(value){setState((){
                          widget.tasks[i].done=value;
                        });
                        }
                      )
                    ],)
                  ),
                )
              ]
            ),
          )
        );
      }).values.toList(),
    );
  }
}