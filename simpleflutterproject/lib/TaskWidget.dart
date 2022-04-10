import 'package:flutter/material.dart';
import 'package:simpleflutterproject/Task.dart';

class TaskWidget extends StatefulWidget {

  final Task task;

  const TaskWidget(this.task,{ Key? key }) : super(key: key);

  @override
  _TaskWidgetState createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> with SingleTickerProviderStateMixin{

  

  double offset=0;
  late AnimationController controller;
  //1 je levo 
  //2 je desno
  int strana=1;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller=AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this
    );
    controller.addListener(() { 
      setState((){
        if(strana==2){
          offset=context.size!.width*controller.value;
        }else{
          offset=-context.size!.width*controller.value;
        }
      });
    });
    controller.addStatusListener((status){
      if(status==AnimationStatus.completed&&strana==2){
        
      }
    });

  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (details){
        setState((){
          offset+=details.delta.dx;
        });
      },
      onHorizontalDragEnd: (details){
        setState((){
          if(offset>0){
            strana=2;
            controller.value=offset/context.size!.width;
            controller.reverse();
          }else{
            strana=1;
            controller.value=-offset/context.size!.width;
            controller.reverse();
          }
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