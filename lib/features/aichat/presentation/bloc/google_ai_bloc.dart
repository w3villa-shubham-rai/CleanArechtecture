import 'package:clean_archtecture/features/aichat/data/models/tokenType_models_params.dart';
import 'package:clean_archtecture/features/aichat/domain/usecase/ai_chat_usecase.dart';
import 'package:clean_archtecture/features/aichat/presentation/bloc/google_ai_event.dart';
import 'package:clean_archtecture/features/aichat/presentation/bloc/google_ai_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class GoogleAiBloc extends Bloc<AiEvent,AiState> {
   final AiChatUseCases aiChatUseCases;
   List<Map<String, String>> messages = [];
  GoogleAiBloc(this.aiChatUseCases):super(AiInitalState()){
   on<AiEventCall>(_onAiEventCall);
  }

   Future<void> _onAiEventCall(AiEventCall event, Emitter<AiState> emit) async {
  messages.add({"role": "user", "content": event.message});
  emit(AiLoadingState(List.from(messages)));

  final result = await aiChatUseCases(AiParams(event.message));

  result.fold(
  (failure) {
    messages.add({"role": "bot", "content": "Error: ${failure.message}"});
   emit(AiErrorState(failure.message ?? "An unknown error occurred", List.from(messages)));
  },
  (response) {
    messages.add({"role": "bot", "content": response});
    emit(AiCompleteState(List.from(messages)));
  },
);

}


  
}