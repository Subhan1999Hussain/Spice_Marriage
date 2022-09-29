import 'package:flutter/material.dart';
import '../Utils/app_colors.dart';
import 'custom_text.dart';

class CustomContainer extends StatefulWidget {
  final String headtext;
  final Widget child;
  const CustomContainer({
    Key? key,
    required this.headtext,
    required this.child,
  }) : super(key: key);

  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.08,
        right: MediaQuery.of(context).size.width * 0.08,
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: AppColors.WHITE,
         
        ),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
                color: AppColors.BLACK,
              ),
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.all(
                  MediaQuery.of(context).size.width * 0.03,
                ),
                child: CustomText(maintext: widget.headtext),
              ),
            ),
            widget.child,
          ],
        ),
      ),
    );
  }
}
