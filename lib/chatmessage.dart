import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final String text;
  final String sender;

  const ChatMessage({super.key, required this.text, required this.sender});

  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              child: Text(sender[0]),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                sender,
                style: const TextStyle(color: Colors.red),
              ),
              Container(
                width: (MediaQuery.of(context).size.width -
                    MediaQuery.of(context).size.width * 0.20),
                margin: const EdgeInsets.only(top: 5.0),
                child: Text(
                  text,
                  softWrap: true,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
