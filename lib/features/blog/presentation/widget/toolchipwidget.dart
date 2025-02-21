import 'package:clean_archtecture/core/theme/app_pallet.dart';
import 'package:flutter/material.dart';

class ToolChipWidget extends StatefulWidget {
  final String btnName;
  final VoidCallback blogTypeFunction;
  Color btnColor;
  final Function(String,bool) onButtonClicked;
  ToolChipWidget({super.key,
       required this.btnName,
      required this.blogTypeFunction,
      required this.onButtonClicked,
      this.btnColor = AppColors.backgroundColor});

  @override
  State<ToolChipWidget> createState() => _ToolChipWidgetState();
}

class _ToolChipWidgetState extends State<ToolChipWidget> {
  bool colorChange = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          widget.btnColor = colorChange ? AppColors.backgroundColor : AppColors.gradient1;
          colorChange = !colorChange; 
        });
        widget.onButtonClicked(widget.btnName,colorChange);
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 22),
        child: Container(
          height: 50,
          width: 120,
          decoration: BoxDecoration(
              color: widget.btnColor,
              border: Border.all(color: AppColors.borderColor),
              borderRadius: const BorderRadius.all(Radius.circular(9))),
          child: Center(
              child: Text(
            widget.btnName,
            style: const TextStyle(
                color: AppColors.whiteColor,
                fontSize: 10,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          )),
        ),
      ),
    );
  }
}
