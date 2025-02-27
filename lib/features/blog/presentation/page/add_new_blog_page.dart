import 'dart:io';
import 'package:clean_archtecture/Utils/pick_image.dart';
import 'package:clean_archtecture/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:clean_archtecture/core/common/cubits/app_user/app_user_state.dart';
import 'package:clean_archtecture/core/theme/app_pallet.dart';
import 'package:clean_archtecture/core/utils/app_bar.dart';
import 'package:clean_archtecture/core/utils/app_extension.dart';
import 'package:clean_archtecture/core/utils/custom_shimmer_effect.dart';
import 'package:clean_archtecture/core/utils/show_snackbar.dart';
import 'package:clean_archtecture/features/blog/presentation/bloc/blog_Event.dart';
import 'package:clean_archtecture/features/blog/presentation/bloc/blog_State.dart';
import 'package:clean_archtecture/features/blog/presentation/bloc/blog_bloc.dart';
import 'package:clean_archtecture/features/blog/presentation/page/blog_Page.dart';
import 'package:clean_archtecture/features/blog/presentation/widget/blog_editor.dart';
import 'package:clean_archtecture/features/blog/presentation/widget/toolchipwidget.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNewBlogPage extends StatefulWidget {
  const AddNewBlogPage({super.key});

  @override
  State<AddNewBlogPage> createState() => _AddNewBlogState();
}

class _AddNewBlogState extends State<AddNewBlogPage> {
  TextEditingController blogTitleController = TextEditingController();
  TextEditingController blogDescriptionController = TextEditingController();
  List<String> toolChipField = ["Computer Science", "Business", "Python", "Science",];
  final imagePostFormKay = GlobalKey<FormState>();
  List<String> selectedButtons = [];
  File? image;
  void selectImage() async {
    final pickedImage = await imagePickFromGallery();
    if (pickedImage != null) {
      setState(() {
        image = pickedImage;
      });
    }
  }

  void uploadBlog() {
    if (imagePostFormKay.currentState!.validate() &&
        selectedButtons.isNotEmpty &&
        image != null) {
      final appUserState = context.read<AppUserCubit>().state;
      if (appUserState is AppUserLoggedIn) {
        final userId = appUserState.user.id.toString();
        context.read<BlogBloc>().add(BlogUploadEvent(
              content: blogDescriptionController.text.trim(),
              image: image!,
              posterId: userId,
              title: blogTitleController.text.trim(),
              topics: selectedButtons,
            ));
      } else {
        debugPrint("uploadBlog() User Not LoggedIn");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  CustomAppBar(
        title: "Add New Post",
        backgroundColor: context.theme.brightness==Brightness.dark?context.themeColors!.backgroundColor:context.themeColors!.gradient1,
        showBackButton: true,
      ),
      body: BlocConsumer<BlogBloc, BlogState>(listener: (context, state) {
        if (state is BlogFailureState) {
          showSnackBar(context, state.error);
        } else if (state is BlogSucessState) {
          context.pushAndRemoveUntil(const BlogPage());
        }
      }, builder: (context, state) {
        if (state is BlogLoadingState) {
          return ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
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
        }
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: imagePostFormKay,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  image != null
                      ? Container(
                          height: 250,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.whiteColor,
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 2,
                                )
                              ]),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.file(
                                image!,
                                fit: BoxFit.cover,
                                filterQuality: FilterQuality.high,
                              )))
                      : InkWell(
                          onTap: () {
                            selectImage();
                          },
                          child: DottedBorder(
                              radius: const Radius.circular(15),
                              borderType: BorderType.RRect,
                              strokeCap: StrokeCap.round,
                              dashPattern: const [12, 10],
                              color: context.theme.brightness==Brightness.dark?context.themeColors!.borderColor:context.themeColors!.secondCardBackGroundColor,
                              child: SizedBox(
                                height: 150,
                                width: double.infinity,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.folder_open,
                                      size: 45,
                                      color: context.theme.brightness==Brightness.dark?context.themeColors!.borderColor:context.themeColors!.secondCardBackGroundColor,
                                    ),
                                    20.bh,
                                    Text(
                                      "Select Your Image",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: context.theme.brightness==Brightness.dark?context.themeColors!.borderColor:context.themeColors!.secondCardBackGroundColor,
                                    ),)
                                  ],
                                ),
                              )),
                        ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(children: [
                      ...List.generate(toolChipField.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 3),
                          child: ToolChipWidget(
                            btnColor: selectedButtons.contains(toolChipField[index])?Colors.blue:Colors.grey.shade300,
                            btnName: toolChipField[index],
                            blogTypeFunction: () {

                            },
                            onButtonClicked: (buttonName, isSelected) {
                              setState(() {
                                if (isSelected) {
                                  selectedButtons.add(buttonName);
                                } else {
                                  selectedButtons.remove(buttonName);
                                }
                              });
                            },
                          ),
                        );
                      })
                    ]),
                  ),
                  20.bh,
                  BlogEditorTextField(
                    controller: blogTitleController,
                    hintText: "Blog Title",
                  ),
                  20.bh,
                  BlogEditorTextField(
                    controller: blogDescriptionController,
                    hintText: "Blog Title",
                  )
                ],
              ),
            ),
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          uploadBlog();
        },
        backgroundColor: (Theme.of(context).brightness == Brightness.dark)
            ? context.themeColors?.chipColor // Dark mode
            : context.themeColors?.secondCardBackGroundColor, // Light mode
        child: const Icon(Icons.done_outline_rounded,
            size: 30, color: AppColors.whiteColor),
      ),
    );
  }
}
