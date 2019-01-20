import 'package:flutter/material.dart';
import 'package:flutter_chat/pages/calls.dart';
import 'package:flutter_chat/pages/camera_alt.dart';
import 'package:flutter_chat/pages/chat_list.dart';
import 'package:flutter_chat/pages/status_screen.dart';

class WhatsAppHome extends StatefulWidget {
  @override
  _WhatsAppHomeState createState() => _WhatsAppHomeState();
}

class _WhatsAppHomeState extends State<WhatsAppHome> with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
      // TODO: implement initState
      super.initState();
      this.controller = new TabController(length: 4, vsync: this);
    }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("FlutterChat"),
        bottom: new TabBar(
          tabs: <Widget>[
            new Tab(
              icon: Icon(Icons.camera_alt, color: Colors.white,),
            ),
            new Tab(
              text: "CHAT",
            ),
            new Tab(
              text: "STATUS",
            ),
            new Tab(
              text: "CALLS",
            )
          ],
          controller: controller,
        ),
      ),
      body: new TabBarView(
        children: <Widget>[
          new Camera(),
          new ChatList(),
          new Status(),
          new Calls(),
        ],
        controller: controller,
      ),
    );
  }
}