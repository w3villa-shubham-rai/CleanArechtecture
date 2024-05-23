import 'package:clean_archtecture/core/theme/app_pallet.dart';
import 'package:clean_archtecture/core/utils/formated_date.dart';
import 'package:clean_archtecture/core/utils/reading_Time_Calculate.dart';
import 'package:flutter/material.dart';
import '../../domain/entites/blog.dart';

class BlogViewerPage extends StatelessWidget {
  final Blog blog;
  const BlogViewerPage({super.key,required this.blog});
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
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
                    // boxShadow: const [
                    //  BoxShadow(
                    //     color: Colors.grey,
                    //     blurRadius: 3,
                    //     spreadRadius: 1,
                    //   ),
                    // ]
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(blog.imageUrl,fit: BoxFit.cover,)),
                ),
                //  Padding(
                //   padding: const EdgeInsets.only(top: 6),
                //   child: Text("${blog.posterName}",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: AppColors.whiteColor),),
                // ),
                 Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text((forMatedDateTime(blog.updatedAt)),style: const TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: AppColors.whiteColor),),
                      Text("${calculatingReadingTimeOfBloc(blog.content)} minutes",style: const TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: AppColors.whiteColor),),
                    ],
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Text(blog.title,style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: AppColors.gradient3),),

                ),
                 Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Text( blog.content,style: const TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: AppColors.greyColor),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
