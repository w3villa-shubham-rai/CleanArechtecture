import 'package:clean_archtecture/features/blog/domain/entites/blog.dart';

class BlogModel extends Blog{
  BlogModel({required super.id, required super.posterId, required super.title, required super.content, required super.imgurl, required super.topics, required super.updatedAt});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'poster_Id': posterId,
      'title': title,
      'content':content,
      'image_url':imgurl,
      'topics':topics,
      'updated_at':updatedAt.toIso8601String(),
    };
  }

  factory BlogModel.fromJson(Map<String,dynamic> map){
    return BlogModel(
      id: map['id'] as String,
      posterId: map['poster_Id'] as String,
      title: map['title'] as String,
      content: map['content'] as String,
      imgurl: map['image_url'] as String,
      topics: List<String>.from(map['topics'] ??[]),
      updatedAt:map['updated_at']==null? DateTime.now() :DateTime.parse(map['updatedAt'])
      );
  }
}