import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    chatWithGPT();
  }


  Future chatWithGPT() async{
    var body = {
      "model": "gpt-3.5-turbo",
      "messages": [{"role": "user", "content": "Hi"}]
    };
    var response = await http.post(
      Uri.parse("https://api.openai.com/v1/chat/completions"),
      headers: {
        // The api key start with sk-...
        "Authorization" : "Bearer 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",
        "Content-Type" : "application/json"
      },
      body: jsonEncode(body)
    );
    var message = jsonDecode(response.body)['choices'][0]['message']['content'];
    print(message);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

















