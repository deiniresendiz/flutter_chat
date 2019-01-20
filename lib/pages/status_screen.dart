import 'package:flutter/material.dart';
import 'package:flutter_chat/models/status_model.dart';

class Status extends StatefulWidget {
  @override
  _StatusState createState() => _StatusState();
}

class _StatusState extends State<Status> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new ListView(
        children: <Widget>[
          new ListTile(
            leading: new CircleAvatar(
              foregroundColor: Theme.of(context).accentColor,
              backgroundColor: Colors.grey,
              backgroundImage: NetworkImage(status[2].imgUrl),
            ),
            title: new Text(
              status[2].name,
              style: new TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: new Text("Añadir a mi estado"),
          ),
          new Text("Recientes",
            style: new TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor),
          ),
          new Divider(),
          new ListTile(
            leading: new CircleAvatar(
              foregroundColor: Theme.of(context).accentColor,
              backgroundColor: Colors.grey,
              backgroundImage: NetworkImage(status[0].imgUrl),
            ),
            title: new Text(
              status[0].name,
              style: new TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          new Divider(),
          new ListTile(
            leading: new CircleAvatar(
              foregroundColor: Theme.of(context).accentColor,
              backgroundColor: Colors.grey,
              backgroundImage: NetworkImage(status[1].imgUrl),
            ),
            title: new Text(
              status[1].name,
              style: new TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          
        ],
      ),
    );
  }
}