import 'dart:html';

import 'package:flutter/material.dart';

class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({super.key})

  @override
  _ChatbotScreenState createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  final TextEditingController _textController = TextEditingController();
  final Uri _openAIUrl = Uri.parse('https://api.openai.com/v1/completions');
  final String _openAIKey =
      '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';
  
}


