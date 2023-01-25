import 'dart:html';
import 'package:aichat/chatmessage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show json;

class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({super.key})

  @override
  _ChatbotScreenState createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  final TextEditingController _textController = TextEditingController();
  final List<ChatMessage> _messages = [];
  final Uri _openAIUrl = Uri.parse('https://api.openai.com/v1/completions');
  final String _openAIKey =
      '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';
  void _sendMessage(String x){
    if(_textController.text.trim().isEmpty){
      return;
    }
    ChatMessage message = ChatMessage(
      text: _textController.text, 
      sender: 'user',);
      setState(() {
        _messages.insert(0, message);
      });
      _textController.clear();
      _getResponse(message.text);
  }

  void _getResponse(String message) async {
    Map<String,String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $_openAIKey',
    };
    Map<String, dynamic> body = {
      'model' : 'text-davinci-003',
      'prompt': message,
      'max_tokens': 256,
    };
    http.Response response = await http.post(_openAIUrl, headers: headers, body: json.encode(body));
    Map<String, dynamic> responseJson = json.decode(response.body);
    print(responseJson['choices'][0]['text']);
    ChatMessage chatMessage = ChatMessage(
      text: responseJson['choices'][0]['text'].toString(),
      sender: 'bot',
    );
    setState(() {
      _messages.insert(0, chatMessage);
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Chat'),
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              reverse: true,
              padding: const EdgeInsets.all(8.0),
              itemBuilder: (_, index) => _messages[index],
              itemCount: _messages.length,
            )
            ),
            const Divider(height: 1.0,),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
              ),
              child: ,
            )
        ],
      ),
    );
  }

}


