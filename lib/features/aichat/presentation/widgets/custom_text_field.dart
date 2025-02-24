import 'package:clean_archtecture/core/theme/app_pallet.dart';
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
      padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 30),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              maxLines: null,
              style: const TextStyle(
                color: AppColors.blackColor,
                fontSize: 15,
                fontWeight: FontWeight.normal
              ),
              cursorColor: AppColors.greenColor,
              minLines: 1,
              decoration: const InputDecoration(
                hintText: "Type a message...",
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
              ),
              
            ),
          ),
          BlocBuilder<GoogleAiBloc,AiState>(builder: (context, state) {
            if (state is AiLoadingState) {
              return const CircularProgressIndicator();
            }
            else{
              return IconButton(
            icon: const Icon(Icons.send,color: AppColors.blueColor,),
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
