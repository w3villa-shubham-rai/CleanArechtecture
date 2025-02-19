abstract interface class BaseRepoOfDataSource {
  Future<String> fetchAiResponse({required String promptText});
}
