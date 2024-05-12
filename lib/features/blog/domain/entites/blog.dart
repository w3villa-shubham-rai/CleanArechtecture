class Blog {
  final String id;
  final String posterId;
  final String title;
  final String content;
  final String imgurl;
  final List<String> topics;
  final DateTime updatedAt;

  Blog({
    required this.id,
    required this.posterId,
    required this.title,
    required this.content,
    required this.imgurl,
    required this.topics,
    required this.updatedAt,
  });

  Blog copyWith({
    String? id,
    String? posterId,
    String? title,
    String? content,
    String? imgurl,
    List<String>? topics,
    DateTime? updatedAt,
  }) {
    return Blog(
      id: id ?? this.id,
      posterId: posterId ?? this.posterId,
      title: title ?? this.title,
      content: content ?? this.content,
      imgurl: imgurl ?? this.imgurl,
      topics: topics ?? this.topics,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
