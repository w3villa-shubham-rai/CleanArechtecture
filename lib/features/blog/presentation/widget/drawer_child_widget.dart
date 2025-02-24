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
      title:  Text(widget.drawerTitleName),
      onTap: () {
       widget.fn!();
      },
    );
  }

}