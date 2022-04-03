import 'package:flutter/material.dart';
import 'package:simpleflutterproject/Task.dart';

class TasksTab extends StatelessWidget {
  final List<Task> tasks;

  TasksTab(this.tasks);
  @override
  Widget build(BuildContext context) {
    if(tasks.isEmpty){
      return Center(
        child:Text("No tasks, click + to add"),
      );
    }

    return ListView(
      children: tasks.map((task){
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Text(task.name),
          Switch(onChanged: (value){},value: task.done,)
        ],);
      }).toList(),
    );
  }
}