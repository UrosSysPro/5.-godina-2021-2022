import 'package:flutter/material.dart';
import 'package:simpleflutterproject/Task.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({ Key? key }) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Task> tasks=[];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("To Do App"),
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: "Tasks",),
              Tab(text:"About"),
            ]),
        ),
        body: TabBarView(
          children:[
            ListView(children:tasks.map(
              (task){
                return Container(color:Colors.green);
                }).toList()),
            Center(child:Text("tab2"))
          ]
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: (){},
          label: Text("Add"),
          icon: Icon(Icons.add),
        ),
      ),
    );
  }
}