import 'package:flutter/material.dart';
import 'package:simpleflutterproject/AboutTab.dart';
import 'package:simpleflutterproject/Task.dart';
import 'package:simpleflutterproject/TasksTab.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({ Key? key }) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Task> tasks=[Task("operi ves",false)];
  String _bottomSheetInputText="";
  bool _bottomSheetSwitchValue=false;

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
            TasksTab(tasks),
            AboutTab()
          ]
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: (){
            showModalBottomSheet(context: context, builder: (context){
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      
                      initialValue: "",
                      decoration:InputDecoration(
                        labelText: "Task Name",
                        border: OutlineInputBorder()
                      )
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [ 
                        Text("Done"),
                        Switch(value: _bottomSheetSwitchValue,onChanged: (value){setState(() {
                          _bottomSheetSwitchValue=value;
                        });
                        },)],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children:[
                        ElevatedButton(onPressed: (){}, child: Text("Create"))
                      ]
                    )
                  ],
                ),
              );
            });
          },
          label: Text("Add"),
          icon: Icon(Icons.add),
        ),
      ),
    );
  }
}