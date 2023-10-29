
import 'package:deliveristo_flutter_frontend_coding_challenge/home_page/presentation/pages/home_page.dart';
import 'package:deliveristo_flutter_frontend_coding_challenge/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await ScreenUtil.ensureScreenSize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: Builder(builder: (BuildContext context) {
        ScreenUtil.init(
          context,
          fontSizeResolver: (fontSize, instance) {
            if (instance.screenWidth < 600) {
              // For mobile screens, reduce font size
              return fontSize * 2.4;
            } else if (instance.screenWidth > 1024) {
              // For iPad screens, keep the original font size
              return fontSize * 3.3;
            } else {
              // For laptop screens, increase font size
              return fontSize * 2.5;
            }
          },
        );
        return const HomePage();
      }),
    );
  }

//
}
