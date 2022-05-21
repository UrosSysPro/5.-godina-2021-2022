import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark(),
    title: "title",
    home:Scaffold(
      appBar: AppBar(
        title:Text("Settings"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: (){},
              icon: Icon(Icons.search),
              splashRadius: 20,
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          SettingsItem("Wi Fi", true),
          SettingsItem("Bluetooth", false),
          SettingsItem("Wi Fi", true),
          SettingsItem("Wi Fi", true),
          SettingsItem("Wi Fi", true),
          SettingsSlider("Brightness", 0.5),
          SettingsLink("link")
        ],
      ),
    )
  ));
}

class SettingsItem extends StatefulWidget {
  String name;
  bool checked;

  SettingsItem(this.name,this.checked);

  @override
  _SettingsItemState createState() => _SettingsItemState();
}

class _SettingsItemState extends State<SettingsItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: Container(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.name),
              Switch(
                value: widget.checked,
                onChanged: (value){
                  setState(() {
                    widget.checked=value;
                  });
                }
              )
            ],
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.black26,
          borderRadius: BorderRadius.circular(5)
        ),
      ),
    );
  }
}

class SettingsSlider extends StatefulWidget {

  String name;
  double value;

  SettingsSlider(this.name,this.value);
  @override
  _SettingsSliderState createState() => _SettingsSliderState();
}

class _SettingsSliderState extends State<SettingsSlider> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: Container(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.name),
              Slider(
                  value: widget.value,
                  onChanged: (value){
                    setState(() {
                      widget.value=value;
                    });
                  }
              )
            ],
          ),
        ),
        decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.circular(5)
        ),
      ),
    );
  }
}

class SettingsLink extends StatelessWidget {
  String name;
  SettingsLink(this.name);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
//        Navigator.push(context, Container());
      },
      child: Padding(
        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: Container(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(name),
                Icon(Icons.arrow_right_alt_outlined)
              ],
            ),
          ),
          decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(5)
          ),
        ),
      ),
    );;
  }
}

//Widget
/*
* Row
* Column
* Stack
* Center
* padding
* Container
*
*
*
*
*
* */