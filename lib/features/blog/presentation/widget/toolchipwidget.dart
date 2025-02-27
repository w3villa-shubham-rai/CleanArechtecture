import 'package:clean_archtecture/core/theme/app_pallet.dart';
import 'package:clean_archtecture/core/utils/app_extension.dart';
import 'package:flutter/material.dart';

class ToolChipWidget extends StatefulWidget {
  final String btnName;
  final VoidCallback blogTypeFunction;
  final Function(String, bool) onButtonClicked;
  final Color btnColor;

  const ToolChipWidget({
    super.key,
    required this.btnName,
    required this.blogTypeFunction,
    required this.onButtonClicked,
    required this.btnColor,
  });

  @override
  State<ToolChipWidget> createState() => _ToolChipWidgetState();
}

class _ToolChipWidgetState extends State<ToolChipWidget> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return InkWell(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
        widget.onButtonClicked(widget.btnName, isSelected);
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 22),
        child: Container(
          height: 50,
          width: 120,
          decoration: BoxDecoration(
            color: isSelected ? (isDarkMode ? context.themeColors?.chipColor ??context.themeColors?.gradient1 : context.themeColors?.gradient1 ?? Colors.blue) : (isDarkMode ? Colors.grey.shade800 : context.themeColors?.secondCardBackGroundColor), // Default colors
            border: Border.all(color: isSelected ? Colors.blue : Colors.black),
            borderRadius: const BorderRadius.all(Radius.circular(9)),
          ),
          child: Center(
            child: Text(
              widget.btnName,
              style: TextStyle(
                color: context.themeColors!.textColor,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}


