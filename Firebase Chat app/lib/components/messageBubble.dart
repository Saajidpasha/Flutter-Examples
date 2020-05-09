import 'package:flutter/material.dart';


class MessageBubble extends StatelessWidget {
  final String text;
  final String sender;
  final bool isMe;
  MessageBubble({this.text, this.sender, this.isMe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            sender,
            style: TextStyle(fontSize: 12.0, color: Colors.black54),
          ),
          Material(
            elevation: 5.0,
            borderRadius: BorderRadius.only(
                topRight: isMe ? Radius.circular(0.0) : Radius.circular(30.0),
                bottomLeft: Radius.circular(30.0),
                topLeft: isMe ? Radius.circular(30.0) : Radius.circular(0.0),
                bottomRight: Radius.circular(30.0)),
            color: isMe == true ? Colors.lightBlueAccent : Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 15.0, color: isMe ? Colors.white : Colors.black54,),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
