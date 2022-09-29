import 'package:flutter/material.dart';
import 'package:spice_marriage/Utils/asset_paths.dart';

class AppLogo extends StatefulWidget {
  const AppLogo({Key? key}) : super(key: key);

  @override
  State<AppLogo> createState() => _AppLogoState();
}

class _AppLogoState extends State<AppLogo> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.15,
        right: MediaQuery.of(context).size.width * 0.15,
        bottom: MediaQuery.of(context).size.width * 0.11,
      ),
      child: Image.asset(AssetPaths.APP_LOGO_IMAGE),
    );
  }
}
