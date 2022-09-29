import 'package:flutter/material.dart';
import '../Utils/app_colors.dart';

class CustomCardContainer extends StatefulWidget {
  final Color backgroundcolor;
  final String text;
  final Function()? onclick;
  const CustomCardContainer(
      {Key? key,
      required this.backgroundcolor,
      required this.text,
      this.onclick})
      : super(key: key);

  @override
  State<CustomCardContainer> createState() => _CustomCardContainerState();
}

class _CustomCardContainerState extends State<CustomCardContainer> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onclick,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.40,
        height: MediaQuery.of(context).size.height * 0.42,
        decoration: BoxDecoration(
          color: widget.backgroundcolor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Text(
            widget.text,
            style: const TextStyle(
              fontSize: 35.0,
              color: AppColors.WHITE,
            ),
          ),
        ),
      ),
    );
  }
}
