import 'package:flutter/material.dart';
import 'package:testflutter/InfoPage.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: (){},
        ),
        title: Text("Main Screen"),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          _kartica(context),
          _kartica(context),
          _kartica(context),
        ],
      ),

    );
  }
  Widget _kartica(BuildContext context){
    return GestureDetector(
      onTap: (){
        print("tap");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => InfoPage()),
        );
      },
      child: Container(
        child:Padding(
          padding: EdgeInsets.all(5.0),
          child:Row(
            children: [
              FlutterLogo(),
              Column(
                children: [
                  Text("naslov "),
                  Text("podnaslov")
                ],
              )
            ],
          ),
        ),
        color: Colors.deepOrange,

      ),
    );
  }
}
