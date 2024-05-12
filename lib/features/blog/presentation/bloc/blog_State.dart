class BlogState {}

final class BlogInitialStae extends BlogState {}

final class BlogLoadingState extends BlogState {}

final class BlogSucessState extends BlogState {}

final class BlogFailureState extends BlogState {
  final String error;
  BlogFailureState(this.error);
}
