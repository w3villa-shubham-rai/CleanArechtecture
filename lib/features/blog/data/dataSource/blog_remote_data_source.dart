import 'dart:io';

import 'package:clean_archtecture/core/error/exception.dart';
import 'package:clean_archtecture/features/blog/data/models/blog_model.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class BlogRemoteDataSource {
  Future<BlogModel> uploadBlog(BlogModel blog);
  Future<String> uploadingBlogImage({required File image, required BlogModel blogModel});
  Future<List<BlogModel>> fetchAllBlogRemote();
  Future<void> deleteblogInRemoteDataSource({required String blogId});
}

class BlogRemoteDataSourceImpl implements BlogRemoteDataSource {
  final SupabaseClient supabaseClient;
  BlogRemoteDataSourceImpl(this.supabaseClient);

  //+++++++++++++++++++uploading blog relate image on Server++++++++++++++++++++

  @override
  Future<String> uploadingBlogImage(
      {required File image, required BlogModel blogModel}) async {
    try {
      // herer id means user id(poster id= user login id)
      await supabaseClient.storage.from('blog_imagess').upload(blogModel.id, image);
      return supabaseClient.storage.from('blog_imagess').getPublicUrl(blogModel.id);
    } catch (message) {
      debugPrint("error in uploadingBlogImage ++++++++++++++++ $message");
      throw ApplictionServerException(
          "error in BlogRemoteDataSourceImpl ${message.toString()}");
    }
  }

  @override
  Future<BlogModel> uploadBlog(BlogModel blog) async {
    try {
      final blogData = await supabaseClient.from('blogs').insert(blog.toJson()).select();
      return BlogModel.fromJson(blogData.first);
    } catch (e) {
      debugPrint("error in uploadblog function +++++++++++++++++======= $e");
      throw ApplictionServerException(
          "error in BlogRemoteDataSourceImpl ${e.toString()}");
    }
  }

  @override
  Future<List<BlogModel>> fetchAllBlogRemote() async {
   try {
     final blogs= await supabaseClient.from('blogs').select('*, profiles(name)');
     return blogs.map((blog) => BlogModel.fromJson(blog).copyWith(posterName: blog['profiles']['name'],)).toList();
   } catch (e) {
      throw ApplictionServerException(  "error in fetchallBlogRemote ${e.toString()}") ;
   }
   
  }
  
  @override
  Future<void> deleteblogInRemoteDataSource({required String blogId}) async{
   try {
    final deleteResPonsce=await supabaseClient.from('blogs').delete().eq('id', blogId);
    if (deleteResPonsce.error != null) {
      throw ApplictionServerException("Error deleting blog: ${deleteResPonsce.error!.message}");
    }
    debugPrint('Blog deleted successfully');
   } catch (e) {
      throw ApplictionServerException(  "error in fetchallBlogRemote ${e.toString()}") ;
   }
  }
}
