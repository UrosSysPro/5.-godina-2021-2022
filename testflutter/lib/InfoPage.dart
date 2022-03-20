
import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_left),
          onPressed: (){},
        ),
        title: Text("Info page"),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: FlutterLogo(),
      ),
    );
  }
}
