import 'package:clean_archtecture/core/theme/app_pallet.dart';
import 'package:flutter/material.dart';

class LoaderFrame extends StatefulWidget {
  const LoaderFrame({super.key});

  @override
  State<LoaderFrame> createState() => _LoaderFrameState();
}

class _LoaderFrameState extends State<LoaderFrame> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Container(
            color: AppColors.backgroundColor.withOpacity(.56),
            height:  MediaQuery.of(context).size.width,
            width:  MediaQuery.of(context).size.height,
            child: const Center(
              child: CircularProgressIndicator(
                color: AppColors.gradient3,
              ),
            ),
          )
        ],
      ),
    );
  }
}