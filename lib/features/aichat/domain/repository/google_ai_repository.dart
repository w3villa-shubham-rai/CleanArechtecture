abstract interface class GoogleAiRepository{
  Future<String> aiCommunication({required String promptText});
}