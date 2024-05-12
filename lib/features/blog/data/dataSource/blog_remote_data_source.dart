import 'dart:io';

import 'package:clean_archtecture/core/error/exception.dart';
import 'package:clean_archtecture/features/blog/data/models/blog_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class BlogRemoteDataSource {
  Future<BlogModel> uploadBlog(BlogModel blog);
  Future<String> uploadingBlogImage({required File image,required BlogModel blogModel});
}

class BlogRemoteDataSourceImpl implements BlogRemoteDataSource {
  final SupabaseClient supabaseClient;
  BlogRemoteDataSourceImpl(this.supabaseClient);


  
  @override
  Future<BlogModel> uploadBlog(BlogModel blog) async {
    try {
      final blogData =await supabaseClient.from('blogs').insert(blog.toJson()).select();
      return BlogModel.fromJson(blogData.first);
    } catch (e) {
      throw ApplictionServerException(
          "error in BlogRemoteDataSourceImpl ${e.toString()}");
    }
  }
  
  @override
  Future<String> uploadingBlogImage({required File image, required BlogModel blogModel}) async{
    try {
      
        await supabaseClient.storage.from('blog_images').upload(blogModel.content, image);
        return supabaseClient.storage.from('blog_images').getPublicUrl(blogModel.id);
    } catch (message) {
       throw ApplictionServerException("error in BlogRemoteDataSourceImpl ${message.toString()}");
    }
  }
  
}
