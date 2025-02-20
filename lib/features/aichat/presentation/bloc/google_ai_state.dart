class AiState{
  
}

class AiInitalState extends AiState{
  final List<Map<String, String>> messages;
  AiInitalState({this.messages = const []});
  
}
class AiLoadingState extends AiState{
  final List<Map<String, String>> messages;
  AiLoadingState(this.messages);
}

class AiErrorState extends AiState{
  String errorMessage;
  final List<Map<String, String>> messages;
  AiErrorState(this.errorMessage,this.messages,);
}

class AiCompleteState extends AiState{
   final List<Map<String, String>> messages;
  AiCompleteState(this.messages);
}