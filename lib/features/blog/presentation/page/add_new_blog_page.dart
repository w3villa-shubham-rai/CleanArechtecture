import 'dart:io';

import 'package:clean_archtecture/Utils/pick_image.dart';
import 'package:clean_archtecture/core/theme/app_pallet.dart';
import 'package:clean_archtecture/features/blog/presentation/widget/blog_editor.dart';
import 'package:clean_archtecture/features/blog/presentation/widget/toolchipwidget.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class AddNewBlogPage extends StatefulWidget {
  static Route() => MaterialPageRoute(
        builder: (context) => const AddNewBlogPage(),
      );
  const AddNewBlogPage({super.key});

  @override
  State<AddNewBlogPage> createState() => _AddNewBlogState();
}

class _AddNewBlogState extends State<AddNewBlogPage> {
  TextEditingController blogTitleController = TextEditingController();
  TextEditingController blogDescriptionController = TextEditingController();
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



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Post"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.done_all_rounded))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             image!=null?
             Container(
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
                ]
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.file(image!,fit: BoxFit.cover,filterQuality: FilterQuality.high,))):
              InkWell(
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
  }
}
