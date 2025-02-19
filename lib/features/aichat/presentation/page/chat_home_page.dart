// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class GeminiChatScreen extends StatefulWidget {
//   const GeminiChatScreen({super.key});

//   @override
//   _GeminiChatScreenState createState() => _GeminiChatScreenState();
// }

// class _GeminiChatScreenState extends State<GeminiChatScreen> {
//   final TextEditingController _controller = TextEditingController();
//   final List<Map<String, String>> _messages = [];
//   final String apiKey = "AIzaSyAN86mr6qrjjkt5hFHR_G2zNN14rbgtI0o"; 
//   bool isLoading = false;

//   Future<void> sendMessage(String message) async {
//     if (message.isEmpty) return;

//     setState(() {
//       _messages.add({"role": "user", "content": message});
//       isLoading = true;
//     });

//     final url ="https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=$apiKey";

//     final response = await http.post(
//       Uri.parse(url),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode({
//         "contents": [
//           {
//             "parts": [
//               {"text": message}
//             ]
//           }
//         ]
//       }),
//     );

//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       final botResponse = data['candidates'][0]['content']['parts'][0]['text'];

//       setState(() {
//         _messages.add({"role": "bot", "content": botResponse});
//       });
//     } else {
//       setState(() {
//         _messages.add({
//           "role": "bot",
//           "content": "Error: ${response.statusCode} - ${response.reasonPhrase}"
//         });
//       });
//     }

//     setState(() {
//       isLoading = false;
//     });

//     _controller.clear();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Gemini AI ChatBot")),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: _messages.length,
//               itemBuilder: (context, index) {
//                 final message = _messages[index];
//                 bool isUser = message['role'] == "user";
//                 return Align(
//                   alignment:
//                       isUser ? Alignment.centerRight : Alignment.centerLeft,
//                   child: Container(
//                     padding: EdgeInsets.all(10),
//                     margin:
//                         const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//                     decoration: BoxDecoration(
//                       color: isUser ? Colors.blue : Colors.grey[300],
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Text(
//                       message['content']!,
//                       style: TextStyle(
//                           color: isUser ? Colors.white : Colors.black),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//           if (isLoading)
//             const Padding(
//               padding: EdgeInsets.all(8.0),
//               child: CircularProgressIndicator(),
//             ),
//           Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: _controller,
//                     decoration: const InputDecoration(
//                       hintText: "Ask Gemini AI...",
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                 ),
//                 IconButton(
//                   icon: const Icon(Icons.send),
//                   onPressed: () => sendMessage(_controller.text),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:clean_archtecture/features/aichat/data/dataSource/datasource_base_repo_imp.dart';
import 'package:clean_archtecture/features/aichat/data/models/tokenType_models_params.dart';
import 'package:clean_archtecture/features/aichat/data/repositories/google_ai_repository_impl.dart';
import 'package:clean_archtecture/features/aichat/domain/usecase/ai_chat_usecase.dart';
import 'package:flutter/material.dart';


class GeminiChatScreen extends StatefulWidget {
  const GeminiChatScreen({super.key});

  @override
  _GeminiChatScreenState createState() => _GeminiChatScreenState();
}

class _GeminiChatScreenState extends State<GeminiChatScreen> {
  late AiChatUseCases aiChatUseCases;
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    // Initialize UseCase with Repository and DataSource
     final dataSource = GooglAiDataSource();
    final repository = GoogleApiImpl(dataSource);
    aiChatUseCases = AiChatUseCases(repository);
  }

  Future<void> sendMessage(String message) async {
    if (message.isEmpty) return;

    setState(() {
      _messages.add({"role": "user", "content": message});
      isLoading = true;
    });

    final result = await aiChatUseCases(AiParams(message));

    debugPrint("result on ui $result");

    result.fold(
      (failure) {
        setState(() {
          _messages.add({"role": "bot", "content": "Error: ${failure.message}"});
        });
      },
      (response) {
        setState(() {
          _messages.add({"role": "bot", "content": response});
        });
      },
    );

    setState(() {
      isLoading = false;
    });

    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Gemini AI ChatBot")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                bool isUser = message['role'] == "user";
                return Align(
                  alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                      color: isUser ? Colors.blue : Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      message['content']!,
                      style: TextStyle(color: isUser ? Colors.white : Colors.black),
                    ),
                  ),
                );
              },
            ),
          ),
          if (isLoading)
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircularProgressIndicator(),
            ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: "Ask Gemini AI...",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () => sendMessage(_controller.text),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
