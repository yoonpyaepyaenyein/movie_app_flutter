import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:focus_detector_v2/focus_detector_v2.dart';
import 'package:get/get.dart';
import 'package:movieapp_flutter/utils/app_colors.dart';

class SuperScaffold extends StatelessWidget {
  // Constructor
  const SuperScaffold({
    super.key,
    required this.child,
    this.topColor = const Color(0xff202020),
    this.botColor = const Color(0xffF4F4F4),
    this.xbotSafe = false,
  });

  // Class variables
  final Widget child;
  final Color topColor;
  final Color botColor;
  final bool xbotSafe;

  // Build method
  @override
  Widget build(BuildContext context) {
    // Returning a widget tree wrapped with FocusDetector and MediaQuery
    return FocusDetector(
      onFocusGained: () {
        setBarColor(topColor, botColor);
      },
      onVisibilityGained: () {
        setBarColor(topColor, botColor);
      },
      child: Container(
        color: topColor,
        child: SafeArea(
          top: true,
          left: false,
          right: false,
          bottom: xbotSafe,
          child: GestureDetector(
            onTap: () {
              // Handling tap to unfocus
              FocusScope.of(context)
                  .unfocus(); // to unfocus any currently focused input.
            },
            child: child,
            // child: GetBuilder<InternetStatusController>(
            //   builder: (InternetStatusController controller) {
            //     if (controller.internetStatus) {
            //       print(
            //           'Controller status internet:::: ${controller.internetStatus}');
            //       return child;
            //     } else {
            //       return const NoInternetConnectionScreen();
            //     }
            //   },
            // ),
          ),
        ),
      ),
    );
  }
}

void setBarColor(Color top, Color bot) {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: top,
    systemNavigationBarColor: bot,
    statusBarIconBrightness:
        top.computeLuminance() > 0.5 ? Brightness.dark : Brightness.light,
    statusBarBrightness: Brightness.light,
  ));
}
