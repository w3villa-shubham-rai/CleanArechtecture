import 'package:clean_archtecture/features/blog/presentation/page/add_new_blog_page.dart';
import 'package:flutter/material.dart';

class Blogpage extends StatefulWidget {
  const Blogpage({super.key});
  static route() => MaterialPageRoute(
        builder: (context) => const Blogpage(),
      );
  @override
  State<Blogpage> createState() => _BlogpageState();
}

class _BlogpageState extends State<Blogpage> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Blog App"),
      actions: [
        IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const AddNewBlogPage()));
            },
            icon: const Icon(Icons.add_circle_rounded))
      ],
    );
  }
}
