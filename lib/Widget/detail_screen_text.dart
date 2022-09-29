import 'package:flutter/material.dart';
import 'package:spice_marriage/Utils/asset_paths.dart';
import '../Utils/app_colors.dart';

class DetailScreenText extends StatefulWidget {
  final String maintext, normaltext;
  const DetailScreenText({
    Key? key,
    required this.maintext,
    required this.normaltext,
  }) : super(key: key);

  @override
  State<DetailScreenText> createState() => _DetailScreenTextState();
}

class _DetailScreenTextState extends State<DetailScreenText> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.09,
        right: MediaQuery.of(context).size.width * 0.09,
        bottom: MediaQuery.of(context).size.height * 0.01,
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.LIGHTGREYS,
          ),
          color: AppColors.WHITE,
        ),
        child: Padding(
          padding: EdgeInsets.all(
            MediaQuery.of(context).size.width * 0.02,
          ),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.maintext,
                    style: const TextStyle(
                      fontSize: 30.0,
                    ),
                  ),
                  Text(
                    widget.normaltext,
                    style: const TextStyle(
                      fontSize: 20.0,
                      color: AppColors.GREYS,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Image.asset(
                AssetPaths.EDIT_ICON,
                scale: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
