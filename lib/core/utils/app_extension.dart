import 'package:flutter/material.dart';

import '../theme/theme_extension/Apptheme_custom_key_colors.dart';

//  **Spacing Extensions (bw & bh)**
extension WidthSizeExtension on num{
  get bw => SizedBox(width: toDouble(),);
  get bh=>SizedBox(height: toDouble(),);
}

/// **Navigation Extensions**

extension NavigationExtension on BuildContext{
  /// **Push a new page onto the stack**
  void push(Widget page) => Navigator.push(this, MaterialPageRoute(builder: (_) => page));

  /// **Replace the current page with a new one**
  void pushReplacement(Widget page) => Navigator.pushReplacement(this, MaterialPageRoute(builder: (_) => page));

  /// **Push a new page and remove all previous pages**
  void pushAndRemoveUntil(Widget page) => Navigator.pushAndRemoveUntil(this, MaterialPageRoute(builder: (_) => page), (route) => false);

  /// **Push a named route**
  void pushNamed(String routeName, {Object? arguments}) => Navigator.pushNamed(this, routeName, arguments: arguments);

  /// **Replace the current page with a named route**
  void pushReplacementNamed(String routeName, {Object? arguments}) => Navigator.pushReplacementNamed(this, routeName, arguments: arguments);

  /// **Push a named route and remove all previous routes**
  void pushNamedAndRemoveUntil(String routeName, {Object? arguments}) =>Navigator.pushNamedAndRemoveUntil(this, routeName, (route) => false, arguments: arguments);

  /// **Go back to the previous screen**
  void pop() => Navigator.pop(this);

  /// **Pop until a certain route condition is met**
  void popUntil(String routeName) => Navigator.popUntil(this, ModalRoute.withName(routeName));

  /// **Check if navigation can pop**
  bool canPop() => Navigator.canPop(this);



//   theme short extension here

  AppThemeColors? get themeColors => Theme.of(this).extension<AppThemeColors>();
  ThemeData get theme=>Theme.of(this);


} 