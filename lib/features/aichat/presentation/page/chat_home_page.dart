import 'package:clean_archtecture/features/aichat/data/dataSource/datasource_base_repo_imp.dart';
import 'package:clean_archtecture/features/aichat/data/models/tokenType_models_params.dart';
import 'package:clean_archtecture/features/aichat/data/repositories/google_ai_repository_impl.dart';
import 'package:clean_archtecture/features/aichat/domain/usecase/ai_chat_usecase.dart';
import 'package:clean_archtecture/features/aichat/presentation/bloc/google_ai_bloc.dart';
import 'package:clean_archtecture/features/aichat/presentation/bloc/google_ai_event.dart';
import 'package:clean_archtecture/features/aichat/presentation/bloc/google_ai_state.dart';
import 'package:clean_archtecture/features/aichat/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class GeminiChatScreen extends StatefulWidget {
  const GeminiChatScreen({super.key});

  @override
  _GeminiChatScreenState createState() => _GeminiChatScreenState();
}

class _GeminiChatScreenState extends State<GeminiChatScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Gemini AI ChatBot")),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<GoogleAiBloc, AiState>(
              builder: (context, state) {
                final messages = state is AiInitalState
                    ? state.messages
                    : (state as dynamic).messages; // Access messages in any state

                return ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final message = messages[index];
                    bool isUser = message['role'] == "user";
                    return Align(
                      alignment:
                          isUser ? Alignment.centerRight : Alignment.centerLeft,
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
                );
              },
            ),
          ),
          ChatInputField(
            onSend: (message) {
            context.read<GoogleAiBloc>().add(AiEventCall(message)); // Trigger API call
            _controller.clear();
          }),
        ],
      ),
    );
  }
}
