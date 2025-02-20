import 'package:clean_archtecture/features/aichat/presentation/bloc/google_ai_bloc.dart';
import 'package:clean_archtecture/features/aichat/presentation/bloc/google_ai_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatInputField extends StatelessWidget {
  final Function(String) onSend;
  const ChatInputField({super.key, required this.onSend});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: "Type a message...",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          BlocBuilder<GoogleAiBloc,AiState>(builder: (context, state) {
            if (state is AiLoadingState) {
              return const CircularProgressIndicator();
            }
            else{
              return IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {
              if (controller.text.isNotEmpty) {
                onSend(controller.text);
              }
            },
          );
            }
          },)
        ],
      ),
    );
  }
}
