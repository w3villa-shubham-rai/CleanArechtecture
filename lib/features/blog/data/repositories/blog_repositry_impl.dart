import 'dart:io';

import 'package:clean_archtecture/core/error/exception.dart';
import 'package:clean_archtecture/core/error/failure.dart';
import 'package:clean_archtecture/features/blog/data/dataSource/blog_remote_data_source.dart';
import 'package:clean_archtecture/features/blog/data/models/blog_model.dart';
import 'package:clean_archtecture/features/blog/domain/entites/blog.dart';
import 'package:clean_archtecture/features/blog/domain/repository/blog_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:uuid/uuid.dart';

class BlogReposryImp implements BlogRepository {
  BlogRemoteDataSource blogRemoteDataSource;
  BlogReposryImp(this.blogRemoteDataSource);
  @override
  Future<Either<Failure, Blog>> sendBlogDataOnServer( {
    required File image,
    required String title,
    required String content,
    required String posterId,
    required List<String> topics,}) async {
    try {
      BlogModel blogModel = BlogModel(
          id: const Uuid().v1(),
          posterId: posterId,
          title: title,
          content: content,
          imgurl: '',
          topics: topics,
          updatedAt: DateTime.now());
      final imageUrl = await blogRemoteDataSource.uploadingBlogImage(image: image, blogModel: blogModel);

      blogModel.copyWith(imgurl: imageUrl);
      final uploadedblog = await blogRemoteDataSource.uploadBlog(blogModel);
      return right(uploadedblog);
    } on ApplictionServerException catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
