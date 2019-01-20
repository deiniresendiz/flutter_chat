import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final String name;
  ChatScreen({this.name});
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = new TextEditingController();

  Widget _buildTextComposer(){
    return new IconTheme(
      data: new IconThemeData(color: Theme.of(context).accentColor),
      child: new Container(
      child: new Row(
        children: <Widget>[
          new Flexible(
          child: new TextField(
            controller: _textController,
          ),
          ),
          new Container(
            child: new IconButton(icon: new Icon(Icons.send,), onPressed: (){

            },),
          )
        ],
      ),
    ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
      title: new Text(widget.name),
    ),
    body: new Container(
      child: new Column(
        children: <Widget>[
          new Container(
            child: _buildTextComposer(),
          )
        ],
      ),
    ),
    );
  }
}