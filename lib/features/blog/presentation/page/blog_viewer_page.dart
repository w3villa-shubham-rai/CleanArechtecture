import 'package:clean_archtecture/core/theme/app_pallet.dart';
import 'package:clean_archtecture/core/utils/app_extension.dart';
import 'package:clean_archtecture/core/utils/formated_date.dart';
import 'package:clean_archtecture/core/utils/reading_time_calculate.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/app_bar.dart';
import '../../domain/entites/blog.dart';

class BlogViewerPage extends StatelessWidget {
  final Blog blog;
  const BlogViewerPage({super.key,required this.blog});
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(
        title: "Blog Details",
        backgroundColor: context.theme.brightness==Brightness.dark?context.themeColors!.backgroundColor:context.themeColors!.gradient1,
        showBackButton: true,
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: Column(
              children: [
                Container(
                  height: 250,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color:AppColors.whiteColor ,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      blog.imageUrl,fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return child; // Image loaded successfully
                        }
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                (loadingProgress.expectedTotalBytes ?? 1)
                                : null, // Show progress if available
                          ),
                        );
                      },
                    )),
                ),

                 Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text((forMatedDateTime(blog.updatedAt)),style:Theme.of(context).textTheme.bodyMedium),
                      Text("${calculatingReadingTimeOfBloc(blog.content)} minutes",style:Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Text(blog.title,style:Theme.of(context).textTheme.bodyLarge,),

                ),
                 Padding(
                  padding:  const EdgeInsets.only(top: 15),
                  child: Text( blog.content,style: Theme.of(context).textTheme.bodySmall,),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
