import 'dart:io';

import 'package:clean_archtecture/core/error/exception.dart';
import 'package:clean_archtecture/core/error/failure.dart';
import 'package:clean_archtecture/features/blog/data/dataSource/blog_remote_data_source.dart';
import 'package:clean_archtecture/features/blog/data/models/blog_model.dart';
import 'package:clean_archtecture/features/blog/domain/entites/blog.dart';
import 'package:clean_archtecture/features/blog/domain/repository/blog_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/network/connection_cheker.dart';
import '../dataSource/blog_local_data_source.dart';

class BlogReposToryImp implements BlogRepository {
  BlogRemoteDataSource blogRemoteDataSource;
  BlogLocalRemoteDataSource blogLocalRemoteDataSource;
  InterNetCheckedData interNetCheckedData;
  BlogReposToryImp(this.blogRemoteDataSource, this.interNetCheckedData, this.blogLocalRemoteDataSource,);
  @override
  Future<Either<Failure, Blog>> sendBlogDataOnServer({
    required File image,
    required String title,
    required String content,
    required String posterId,
    required List<String> topics,
  }) async {
    try {
      if(! await ((interNetCheckedData.isConnected))){
        return  left(Failure("NO Internet connection"));
      }
      BlogModel blogModel = BlogModel(
          id: const Uuid().v1() ?? "",
          posterId: posterId,
          title: title,
          content: content,
          imageUrl: '',
          topics: topics,
          updatedAt: DateTime.now());

      final imageUrl = await blogRemoteDataSource.uploadingBlogImage(
          image: image, blogModel: blogModel);

      blogModel = blogModel.copyWith(
        imageUrl: imageUrl,
      );
      final uploadedblog = await blogRemoteDataSource.uploadBlog(blogModel);
      return right(uploadedblog);
    } on ApplictionServerException catch (e) {
      debugPrint("error in sendBlogDataOnServer+++++++++++++++++======= ");
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Blog>>> fetchedAllBlogRepository() async {
    try {
      if(!await ((interNetCheckedData.isConnected))){
        final blogs= blogLocalRemoteDataSource.loadBlogs();
        return  right(blogs);
      }
      final allBlogs = await blogRemoteDataSource.fetchallBlogRemote();
      blogLocalRemoteDataSource.uploadLocalBlogs(blogs: allBlogs);
      return right(allBlogs);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
