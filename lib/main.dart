import 'package:flutter/material.dart';

import './home.dart';
import './popular.dart';
import './news.dart';

void main() {
  runApp(DWTabs());
}

class DWTabs extends StatefulWidget {
  @override
  DwTabState createState() => DwTabState();
}

class DwTabState extends State<DWTabs> with SingleTickerProviderStateMixin {
  
  TabController controller;

  @override
  void initState(){
    super.initState();
    controller = TabController(vsync: this, length: 3);
  }

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('DW Tabs'),
          backgroundColor: Colors.red[800],
          bottom: TabBar(
            controller: controller,
            tabs: <Tab>[
              Tab(icon: Icon(Icons.home),),
              Tab(icon: Icon(Icons.note),),
              Tab(icon: Icon(Icons.poll),),
            ],
          ),
        ),

        body: TabBarView(
          controller: controller,
          children: <Widget>[
            Home(),
            Popular(),
            News(),
          ],
        ),

      )
    );
  }
}