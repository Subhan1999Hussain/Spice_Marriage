import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spice_marriage/Utils/app_router.dart';
import 'Utils/app_strings.dart';

// void main() {
//   runApp(MyApp()
//       //  DevicePreview(
//       //   enabled: true,
//       //   tools: [...DevicePreview.defaultTools],
//       //   builder: (context) => MyApp(),
//       // ),
//       );

// }
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          /* Do something here if you want */
          return false;
        },
        child: MaterialApp(
          // useInheritedMediaQuery: ,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRouter().onGenerateRoute,
          theme: ThemeData(
            fontFamily: AppStrings.MYLOVE_FONT,
            primarySwatch: Colors.grey,
          ),
        ));
  }
}
