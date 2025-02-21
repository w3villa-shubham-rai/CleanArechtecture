import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;
  final bool showBackButton;

  const CustomAppBar({
    super.key,
    required this.title,
    this.backgroundColor = Colors.blue,
    this.showBackButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      backgroundColor: backgroundColor,
      elevation: 2,
      leading: showBackButton
          ? IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            )
          : Builder(
              builder: (context) {
                return IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    Scaffold.of(context).openDrawer(); 
                  },
                );
              },
            ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
