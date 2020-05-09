import 'package:flutter/material.dart';
import 'chat_screen.dart';

class AllChatsScreen extends StatefulWidget {
  @override
  _AllChatsScreenState createState() => _AllChatsScreenState();
}

class _AllChatsScreenState extends State<AllChatsScreen> {
  MessageStream messageStream = MessageStream();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
      children: [
        Text('${messageStream.sender}')
      ],
      
    );
  },
    );
}
