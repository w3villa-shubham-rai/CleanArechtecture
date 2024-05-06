import 'package:clean_archtecture/features/blog/presentation/page/add_new_blog_page.dart';
import 'package:flutter/material.dart';

class Blogpage extends StatefulWidget {
  const Blogpage({super.key});

  @override
  State<Blogpage> createState() => _BlogpageState();
}

class _BlogpageState extends State<Blogpage> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Blog App"),
      actions: [
        IconButton(onPressed: (){
          Navigator.push(context, AddNewBlogPage.Route());
        }, icon: const Icon(Icons.add_circle_rounded))
      ],
    );
  }
}