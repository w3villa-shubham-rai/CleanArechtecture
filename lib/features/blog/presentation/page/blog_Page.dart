import 'package:clean_archtecture/core/services/theme_service.dart';
import 'package:clean_archtecture/core/theme/app_pallet.dart';
import 'package:clean_archtecture/core/utils/app_bar.dart';
import 'package:clean_archtecture/core/utils/app_enum.dart';
import 'package:clean_archtecture/core/utils/app_extension.dart';
import 'package:clean_archtecture/core/utils/custom_shimmer_effect.dart';

import 'package:clean_archtecture/core/utils/show_snackbar.dart';
import 'package:clean_archtecture/features/aichat/presentation/page/chat_home_page.dart';
import 'package:clean_archtecture/features/blog/presentation/bloc/blog_Event.dart';
import 'package:clean_archtecture/features/blog/presentation/bloc/blog_State.dart';
import 'package:clean_archtecture/features/blog/presentation/bloc/blog_bloc.dart';
import 'package:clean_archtecture/features/blog/presentation/page/add_new_blog_page.dart';
import 'package:clean_archtecture/features/blog/presentation/widget/blog_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widget/drawer_child_widget.dart';

class Blogpage extends StatefulWidget {
  const Blogpage({super.key});
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
      appBar: const CustomAppBar(
        title: "Blog Page",
        backgroundColor: AppColors.gradient1,
        showBackButton: false,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Theme Change'),
            ),
            DrawerChildWidget(
              drawerTitleName: "Dark Mode",
              fn: () {
                    ThemeService.themeService.updateTheme(AppTheme.darkBlue);
                    Navigator.pop(context);
              },
            ),
            DrawerChildWidget(
              drawerTitleName: "Light Mode",
              fn: () {
                ThemeService.themeService.updateTheme(AppTheme.lightRed);
                Navigator.pop(context);
              },
            ),
            DrawerChildWidget(
              drawerTitleName: "Custom Mode",
              fn: () {
                ThemeService.themeService.updateTheme(AppTheme.dark);
                Navigator.pop(context);
              },
            ),
            DrawerChildWidget(
              drawerTitleName: "Ai Tab",
              fn: () {
                context.push(const GeminiChatScreen());
              },
            ),
          ],
        ),
      ),
      
      body: BlocConsumer<BlogBloc, BlogState>(
        listener: (context, state) {
          if (state is BlogFailureState) {
            showSnackBar(context, state.error);
          }
        },
        builder: (context, state) {
          if (state is BlogLoadingState) {
            return ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding:const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: CustomShimmer(
                    width: double.infinity,
                    height: 300, 
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(10),
                  ),
                );
              },
            );
          } else if (state is BlogDisplaySucessState) {
            return ListView.builder(
              itemCount: state.blogs.length,
              itemBuilder: (context, index) {
                final blog = state.blogs[index];
                return BlogCard(
                  blog: blog,
                  cardColor: index % 2 == 0
                      ? Theme.of(context).primaryColor
                      : Theme.of(context).primaryColorDark,
                );
              },
            );
          } else {
            return Container();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push(const AddNewBlogPage());
        },
        backgroundColor: AppColors.blueColor,
        child: const Icon(Icons.add, size: 30, color: AppColors.whiteColor),
      ),
    );
  }
}
