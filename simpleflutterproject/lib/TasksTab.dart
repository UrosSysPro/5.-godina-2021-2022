import 'package:flutter/material.dart';
import 'package:simpleflutterproject/Task.dart';
import 'package:simpleflutterproject/TaskWidget.dart';

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

    List<Widget> children=[];  

    for(int i=0;i<widget.tasks.length;i++){
      children.add(TaskWidget(widget.tasks[i]));
    }

    return ListView(
      children:children
    );
    
  }
}