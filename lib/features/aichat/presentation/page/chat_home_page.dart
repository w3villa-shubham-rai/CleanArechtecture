
import 'package:clean_archtecture/features/aichat/presentation/bloc/google_ai_bloc.dart';
import 'package:clean_archtecture/features/aichat/presentation/bloc/google_ai_event.dart';
import 'package:clean_archtecture/features/aichat/presentation/bloc/google_ai_state.dart';
import 'package:clean_archtecture/features/aichat/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_pallet.dart';
import '../../../../core/utils/app_bar.dart';


class GeminiChatScreen extends StatefulWidget {
  const GeminiChatScreen({super.key});

  @override
  GeminiChatScreenState createState() => GeminiChatScreenState();
}

class GeminiChatScreenState extends State<GeminiChatScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Google AI",
        backgroundColor: AppColors.gradient1,
        showBackButton: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<GoogleAiBloc, AiState>(
              builder: (context, state) {
                final messages = state is AiInitalState
                    ? state.messages
                    : (state as dynamic).messages;
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
                          color: isUser ? AppColors.blueColor :AppColors.greyColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          message['content']!,
                          style: TextStyle(color: isUser ?AppColors.whiteColor : AppColors.blackColor),
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
