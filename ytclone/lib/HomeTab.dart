import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[ CustomScrollView(

        slivers: [
          SliverAppBar(
            title:Text("My app"),
            floating: true,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (context,index){
                  return Row(
                    children: [
                      FlutterLogo(),
                      Column(
                        children: [
                          Text("Video title"),
                          Text("video desc")
                        ],
                      )
                    ],
                  );
                },
                childCount: 30
            )
          )
        ],
      ),
      DraggableScrollableSheet(
          snap: true,
          initialChildSize: 0.5,
          snapSizes: [0.1,0.5,1],
          builder: (context,controller) {
            return Container(
              color: Colors.green,
            );
          }
          ),
      ]
    );
  }
}
