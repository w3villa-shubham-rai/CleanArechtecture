
import 'package:clean_archtecture/core/utils/app_extension.dart';
import 'package:clean_archtecture/core/utils/reading_time_calculate.dart';
import 'package:clean_archtecture/features/blog/domain/entites/blog.dart';
import 'package:clean_archtecture/features/blog/presentation/bloc/blog_Event.dart';
import 'package:clean_archtecture/features/blog/presentation/bloc/blog_bloc.dart';
import 'package:clean_archtecture/features/blog/presentation/page/blog_viewer_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class BlogCard extends StatefulWidget {
  final Blog blog;
  final Color? cardColor;
  const BlogCard({super.key, required this.blog, required  this.cardColor});
  @override
  State<BlogCard> createState() => _BlogCardState();
}

class _BlogCardState extends State<BlogCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {
          context.push(BlogViewerPage(blog: widget.blog,));
        },
        child: Container(
          height: 300,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10).copyWith(
                bottomLeft: const Radius.circular(20),
                bottomRight:  const Radius.circular(20),
              ),
              color:  widget.cardColor),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: widget.blog.topics
                        .map(
                          (topics) => Padding(
                            padding:  const EdgeInsets.all(8.0),
                            child: Container(
                              height: 50,
                              width: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(9),
                                  color:Theme.of(context).colorScheme.onSurface),
                              child: Center(
                                  child: Text(
                                topics,
                                textAlign: TextAlign.center,
                                style:  TextStyle(
                                  fontSize: 13,
                                  color:Theme.of(context).colorScheme.onSecondary,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    textAlign: TextAlign.center,
                    widget.blog.title,
                    style:  TextStyle(
                      fontSize: 22,
                      color:Theme.of(context).colorScheme.onSecondary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              50.bh,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                padding: const EdgeInsets.only(left: 10, bottom: 17),
                child: Text(
                  '${calculatingReadingTimeOfBloc(widget.blog.content)} minutes',
                  style: TextStyle(
                      color:Theme.of(context).colorScheme.onSecondary,fontWeight: FontWeight.w700),
                ),
              ),
              InkWell(
                onTap: () {
                     context.read<BlogBloc>().add(BlogDeleteEvent(blogId: widget.blog.id));
                },
                child: const Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Icon(Icons.delete,size: 20,color: Colors.amber,),
                ),
              ),
              ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
