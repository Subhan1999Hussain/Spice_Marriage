import 'package:flutter/material.dart';
import '../Utils/app_colors.dart';
import '../Utils/app_strings.dart';

class CustomBottomContainer extends StatefulWidget {
  final String starttext, endtext;
  final Function()? onclick;
  bool? is_padding;
  CustomBottomContainer({
    Key? key,
    required this.starttext,
    required this.endtext,
    this.onclick,
    this.is_padding = false,
  }) : super(key: key);

  @override
  State<CustomBottomContainer> createState() => _CustomBottomContainerState();
}

class _CustomBottomContainerState extends State<CustomBottomContainer> {
  @override
  Widget build(BuildContext context) {
    return widget.is_padding == true
        ? Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height / 8,
            ),
            child: InkWell(
              onTap: widget.onclick,
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(
                    color: AppColors.WHITE,
                    fontFamily: AppStrings.MYLOVE_FONT,
                    fontSize: 25,
                  ),
                  text: widget.starttext,
                  children: [
                    TextSpan(
                      style: const TextStyle(
                        color: AppColors.WHITE,
                      ),
                      text: widget.endtext,
                    ),
                  ],
                ),
              ),
            ),
          )
        : Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.08,
              right: MediaQuery.of(context).size.width * 0.08,
            ),
            child: InkWell(
              onTap: widget.onclick,
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(
                    color: AppColors.WHITE,
                    fontFamily: AppStrings.MYLOVE_FONT,
                    fontSize: 25,
                  ),
                  text: widget.starttext,
                  children: [
                    TextSpan(
                      style: const TextStyle(
                        color: AppColors.WHITE,
                      ),
                      text: widget.endtext,
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
