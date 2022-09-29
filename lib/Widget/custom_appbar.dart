import 'package:flutter/material.dart';
import 'package:spice_marriage/Utils/asset_paths.dart';
import 'package:spice_marriage/Utils/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool isLeading;

  const CustomAppBar({Key? key, this.title, this.isLeading = true})
      : super(key: key);
  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.TRANSPARENT,
      elevation: 0.0,
      title: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.width * 0.05,
        ),
        child: Text(
          title ?? "",
          style: const TextStyle(
            color: AppColors.WHITE,
            fontSize: 45.0,
          ),
        ),
      ),
      centerTitle: true,
      leading: isLeading
          ? Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.width * 0.07,
                bottom: MediaQuery.of(context).size.width * 0.03,
              ),
              child: InkWell(
                onTap: () {
                  Navigator.pop(
                    context,
                  );
                },
                child: Image.asset(
                  AssetPaths.ARROW_NAVIGATE_ICON,
                  fit: BoxFit.contain,
                  scale: 1,
                ),
              ),
            )
          : const SizedBox(),
    );
  }
}
