import 'package:flutter/material.dart';
import '../Utils/app_colors.dart';

class CustomText extends StatefulWidget {
  final String maintext;
  final bool? underline;
  const CustomText({
    Key? key,
    required this.maintext,
    this.underline,
  }) : super(key: key);

  @override
  State<CustomText> createState() => _CustomTextState();
}

class _CustomTextState extends State<CustomText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.maintext,
      style: TextStyle(
        fontSize: 35.0,
        color: AppColors.WHITE,
        decoration: (widget.underline == true)
            ? TextDecoration.underline
            : TextDecoration.none,
        decorationColor: AppColors.WHITE,
      ),
    );
  }
}
