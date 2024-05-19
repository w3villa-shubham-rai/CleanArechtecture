import 'dart:io';
import 'package:clean_archtecture/Utils/pick_image.dart';
import 'package:clean_archtecture/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:clean_archtecture/core/common/cubits/app_user/app_user_state.dart';
import 'package:clean_archtecture/core/theme/app_pallet.dart';
import 'package:clean_archtecture/core/utils/loader_frame.dart';
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
  final imagepostFormKay = GlobalKey<FormState>();
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
    if (imagepostFormKay.currentState!.validate() && selectedButtons.isNotEmpty &&  image != null) {
      final appUserState = context.read<AppUserCubit>().state;
      if (appUserState is AppUserLoggedIn) {
        final userId = appUserState.user.id.toString();
        context.read<BlogBloc>().add(BlogUploadEvent(
              content: blogDescriptionController.text.trim(),
              image: image!,
              posterId: userId, // Use the string representation of UserModel ID
              title: blogTitleController.text.trim(),
              topics: selectedButtons,
            ));
      } else {
        debugPrint("uploadBlog() User Not LogedIn");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add New Post"),
          actions: [
            IconButton(
                onPressed: () {
                  uploadBlog();
                },
                icon: const Icon(Icons.done_all_rounded))
          ],
        ),
        body: BlocConsumer<BlogBloc, BlogState>(listener: (context, state) {
          if (state is BlogFailureState) {
            showSnackBar(context, state.error);
          } else if (state is BlogSucessState) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const Blogpage()),
              (Route<dynamic> route) => false,
            );
          }
        }, builder: (context, state) {
          if (state is BlogLoadingState) {
            return const LoaderFrame();
          }
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: imagepostFormKay,
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
                                color: AppColors.borderColor,
                                child: const SizedBox(
                                  height: 150,
                                  width: double.infinity,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.folder_open,
                                        size: 45,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        "Select Your Image",
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ToolChipWidget(
                            btnName: "Computer Science",
                            blogTypeFunction: () {},
                            onButtonClicked: (buttonName, btncolor) {
                              btncolor
                                  ? selectedButtons.add(buttonName)
                                  : selectedButtons.remove(buttonName);
                            },
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          ToolChipWidget(
                            btnName: "Bussiness",
                            blogTypeFunction: () {},
                            onButtonClicked: (buttonName, btncolor) {
                              btncolor
                                  ? selectedButtons.add(buttonName)
                                  : selectedButtons.remove(buttonName);
                            },
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          ToolChipWidget(
                            btnName: "Python",
                            blogTypeFunction: () {},
                            onButtonClicked: (buttonName, btncolor) {
                              btncolor
                                  ? selectedButtons.add(buttonName)
                                  : selectedButtons.remove(buttonName);
                            },
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          ToolChipWidget(
                            btnName: "Science",
                            blogTypeFunction: () {},
                            onButtonClicked: (buttonName, btncolor) {
                              btncolor
                                  ? selectedButtons.add(buttonName)
                                  : selectedButtons.remove(buttonName);
                              print("seleted name $selectedButtons");
                            },
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    BlogEditorTextField(
                      controller: blogTitleController,
                      hintText: "Blog Title",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    BlogEditorTextField(
                      controller: blogDescriptionController,
                      hintText: "Blog Title",
                    )
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
