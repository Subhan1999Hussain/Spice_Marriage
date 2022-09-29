import 'package:flutter/material.dart';
import 'package:spice_marriage/Utils/asset_paths.dart';
import 'package:spice_marriage/Utils/app_colors.dart';

class BackgroundImage extends StatefulWidget {
  final Widget child;
  const BackgroundImage({Key? key, required this.child}) : super(key: key);

  @override
  State<BackgroundImage> createState() => _BackgroundImageState();
}

class _BackgroundImageState extends State<BackgroundImage> {
  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
        onWillPop: () async {
          /* Do something here if you want */
          return false;
        },child:
    Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  AssetPaths.BACKGROUND_IMAGE,
                ),
                fit: BoxFit.fill),
          ),
      child: Scaffold(
        backgroundColor: AppColors.TRANSPARENT,
        body: widget.child,
      
      ),)
    );
  }
}
