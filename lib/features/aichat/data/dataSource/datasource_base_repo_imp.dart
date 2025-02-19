import 'dart:convert';

import 'package:clean_archtecture/features/aichat/data/dataSource/datasource_baser_repo.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class GooglAiDataSource implements BaseRepoOfDataSource{
  final String apiKey = "AIzaSyAN86mr6qrjjkt5hFHR_G2zNN14rbgtI0o"; 
   
 @override
Future<String> fetchAiResponse({required String promptText}) async {
  final url = "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=$apiKey";

  final response = await http.post(
    Uri.parse(url),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      "contents": [
        {
          "parts": [
            {"text": promptText}
          ]
        }
      ]
    }),
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    if (data['candidates'] != null && data['candidates'].isNotEmpty) {
      debugPrint("data here of AI $data['candidates'][0]['content']['parts'][0]['text']{}");
      return data['candidates'][0]['content']['parts'][0]['text'];
      
    } else {
      return "No valid response received.";
    }
  } else {
    throw Exception("Error: ${response.statusCode} - ${response.reasonPhrase}");
  }
}

}