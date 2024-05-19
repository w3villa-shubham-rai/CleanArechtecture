import 'package:clean_archtecture/core/theme/app_pallet.dart';
import 'package:clean_archtecture/core/utils/reading_Time_Calculate.dart';
import 'package:clean_archtecture/features/blog/data/models/blog_model.dart';
import 'package:clean_archtecture/features/blog/domain/entites/blog.dart';
import 'package:clean_archtecture/features/blog/presentation/page/blog_viewer_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BlogCard extends StatefulWidget {
  final Blog blog;
  final Color? cardcolor;
  const BlogCard({super.key, required this.blog, required  this.cardcolor});

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
          Navigator.push(context, MaterialPageRoute(builder: (context) =>  BlogViewerPage(blog: widget.blog,)));
        },
        child: Container(
          height: 300,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10).copyWith(
                bottomLeft: const Radius.circular(20),
                bottomRight:  const Radius.circular(20),
              ),
              color:  widget.cardcolor),
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
                            padding:  EdgeInsets.all(8.0),
                            child: Container(
                              height: 50,
                              width: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(9),
                                  color:AppColors.cobaltBlue),
                              child: Center(
                                  child: Text(
                                topics,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: AppColors.whiteColor,
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
                    style: const TextStyle(
                      fontSize: 22,
                      color: AppColors.borderColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, bottom: 17),
                child: Text(
                  '${calculatingReadingTimeOfBloc(widget.blog.content)} minutes',
                  style: const TextStyle(
                      color: AppColors.borderColor, fontWeight: FontWeight.w700),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
