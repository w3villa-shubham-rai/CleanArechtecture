import 'dart:js_interop';

import 'package:clean_archtecture/core/utils/loader_frame.dart';
import 'package:clean_archtecture/core/utils/show_snackbar.dart';
import 'package:clean_archtecture/features/blog/presentation/bloc/blog_Event.dart';
import 'package:clean_archtecture/features/blog/presentation/bloc/blog_State.dart';
import 'package:clean_archtecture/features/blog/presentation/bloc/blog_bloc.dart';
import 'package:clean_archtecture/features/blog/presentation/page/add_new_blog_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  void initState() {
    super.initState();
    context.read<BlogBloc>().add(FetchallBlogEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Blog App"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddNewBlogPage()));
                },
                icon: const Icon(Icons.add_circle_rounded))
          ],
        ),
        body: BlocConsumer<BlogBloc, BlogState>(
          listener: (context, state) {
            if (state is BlogFailureState) {
              showSnackbar(context, state.error);
            }
          },
          builder: (context, state) {
            if (state is BlogLoadingState) {
              return const Center(child: LoaderFrame());
            } else if (state is BlogDisplaySucessState) {
              return ListView.builder(
                itemCount:state.blogs.length,
                itemBuilder: (context, index) {
                  return Container();
                },
              );
            } else {
              return Container();
            }
          },
        ));
  }
}
