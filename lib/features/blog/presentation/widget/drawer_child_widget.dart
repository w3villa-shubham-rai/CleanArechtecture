import 'package:clean_archtecture/core/utils/app_extension.dart';
import 'package:flutter/material.dart';

class DrawerChildWidget extends StatefulWidget {
  const DrawerChildWidget({super.key ,required this.drawerTitleName, this.fn});

  final String drawerTitleName;
  final VoidCallback? fn;

  @override
  State<DrawerChildWidget> createState() {
   return _DrawerChildWidget();
  }
}

class _DrawerChildWidget extends State<DrawerChildWidget>{
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title:  Text(widget.drawerTitleName,style: TextStyle(
        fontSize: 17,
        color:context.theme.brightness==Brightness.dark?context.themeColors?.textColor:context.themeColors?.borderColor,
        fontWeight: FontWeight.bold,
      ),),
      onTap: () {
       widget.fn!();
      },
    );
  }

}