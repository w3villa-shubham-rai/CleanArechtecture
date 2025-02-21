

import 'package:clean_archtecture/features/blog/domain/entites/blog.dart';

class BlogState {}

final class BlogInitialStae extends BlogState {}

final class BlogLoadingState extends BlogState {}

final class BlogSucessState extends BlogState {}

final class BlogFailureState extends BlogState {
  final String error;
  BlogFailureState(this.error);
}

final class BlogDisplaySucessState extends BlogState {
  List<Blog> blogs;
  BlogDisplaySucessState(this.blogs);
}

