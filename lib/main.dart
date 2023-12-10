import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp_flutter/utils/theme.dart';
import 'package:movieapp_flutter/view/home/home_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (_, __, ___) {
      return GetMaterialApp(
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context)
                .copyWith(textScaler: TextScaler.noScaling),
            child: child!,
          );
        },
        title: 'Cine Plus',
        defaultTransition: Transition.fadeIn,
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        home: const HomeScreen(),
      );
    });
  }
}
