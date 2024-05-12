import 'dart:io';

import 'package:clean_archtecture/core/error/failure.dart';
import 'package:clean_archtecture/features/blog/domain/entites/blog.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class BlogRepository{
  Future<Either<Failure,Blog>> sendBlogDataOnServer(
    { required File image,
    required String title,
    required String content,
    required String posterId,
    required List<String> topics,});
}

