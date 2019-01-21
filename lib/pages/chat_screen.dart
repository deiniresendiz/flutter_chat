import 'package:flutter/material.dart';
import 'package:flutter_chat/models/chat_model.dart';

class ChatScreen extends StatefulWidget {
  final String name;
  
  ChatScreen({this.name});
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin{
  bool _isTyped = false;
  final TextEditingController _textController = new TextEditingController();
  final List<ChatMessage> _mensages = <ChatMessage>[];
  void _handledSubmit(String text){
    _textController.clear();
    ChatMessage menssage = new ChatMessage(
      menssage: text,
      animationController: new AnimationController(
        duration: new Duration(milliseconds: 700),
        vsync: this
      ),
      name: widget.name,
    );
    setState(() {
      _mensages.insert(0, menssage);
      var data = messageData.firstWhere((t) => t.name == widget.name);
      data.message = menssage.menssage;
      _isTyped = false;
    });
    menssage.animationController.forward();
    print(text);
  }

  Widget _buildTextComposer(){
    return new IconTheme(
      data: new IconThemeData(color: Theme.of(context).accentColor),
      child: new Container(
      child: new Row(
        children: <Widget>[
          new Flexible(
          child: new TextField(
            controller: _textController,
            onChanged: (String text){
              setState(() {
                _isTyped = text.length > 0;
              });
            },
            decoration: new InputDecoration.collapsed(
              hintText: "Enviar mensaje",
            )
          ),
          ),
          new Container(
            child: new IconButton(icon: new Icon(Icons.send,), 
            onPressed: _isTyped ? () => _handledSubmit(_textController.text) : null,),
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
          new Flexible(
            child: new ListView.builder(
              itemBuilder: (_,int index) => _mensages[index],
              itemCount: _mensages.length,
            ),
          ),
          new Divider(
            height: 1.0,
          ),
          new Container(
            child: _buildTextComposer(),
          )
        ],
      ),
    ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String name;
  final AnimationController animationController;
  final String menssage;
  ChatMessage({this.name,this.animationController,this.menssage});
  @override
  Widget build(BuildContext context) {
    return new SizeTransition(
      sizeFactor: new CurvedAnimation(
        parent: animationController,
        curve: Curves.easeInOut,
      ),
      child: new Container(
        child: new Row(
          children: <Widget>[
            new Container(
              child: new CircleAvatar(
                child: new Text(name[0]),
              ),
            ),
            new Expanded(
              child: new Column(
                children: <Widget>[
                  new Text(name),
                  new Container(
                    child: new Text(menssage),
                  )
                ],
              ),
            )
        ],),
      ),
    );
  }
}