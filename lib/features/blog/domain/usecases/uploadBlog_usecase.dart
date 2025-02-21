import 'dart:io';
import 'package:clean_archtecture/core/error/failure.dart';
import 'package:clean_archtecture/core/usecase/usecase.dart';
import 'package:clean_archtecture/features/blog/domain/entites/blog.dart';
import 'package:clean_archtecture/features/blog/domain/repository/blog_repository.dart';
import 'package:fpdart/fpdart.dart';

class UploadBlogUseCase implements UseCase<Blog, UploadBlogParams> {
  BlogRepository blogReposryImp;
  UploadBlogUseCase(this.blogReposryImp);
  @override
  Future<Either<Failure, Blog>> call(UploadBlogParams params) async {
      return await blogReposryImp.sendBlogDataOnServer(image: params.image, title: params.title, content: params.content, posterId: params.posterId, topics: params.topics);
  }
}

class UploadBlogParams {
  final String posterId;
  final String title;
  final String content;
  final File image;
  final List<String> topics;
  UploadBlogParams({
    required this.posterId,
    required this.title,
    required this.content,
    required this.image,
    required this.topics,
  });
}
