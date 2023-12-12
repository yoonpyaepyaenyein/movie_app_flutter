import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:movieapp_flutter/utils/app_values.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/app_colors.dart';

class PopularDetailScreen extends StatelessWidget {
  const PopularDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ));
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          ..._buildBackground(context),
          _buildMovieInformation(context),
        ],
      ),
    );
  }

  Positioned _buildMovieInformation(BuildContext context) {
    return Positioned(
      bottom: 150,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Text(
            'Movie Title',
            style: TextStyle(
                color: AppColor.white,
                fontSize: AppValues.mediumText,
                fontWeight: FontWeight.bold,
                letterSpacing: 1),
          ),
          SizedBox(
            height: 4.w,
          ),
          Text(
            'Released | 2023-11-17 | 102 min',
            style: TextStyle(
              color: AppColor.white,
              fontSize: AppValues.smallText,
            ),
          ),
          SizedBox(
            height: 10.w,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            child: Text(
              'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero ,for use in a type specimen book. It usually begins with:',
              maxLines: 8,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  height: 1.75,
                  color: Colors.white,
                  letterSpacing: 1,
                  wordSpacing: 1),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> _buildBackground(context) {
    return [
      Container(
        height: double.infinity,
        color: AppColor.black,
      ),
      Image.asset(
        'assets/images/cat.jpg',
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.5,
        fit: BoxFit.cover,
      ),
      Positioned(
        top: 20,
        child: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back,
            color: AppColor.white,
            size: 26,
          ),
        ),
      ),
      Positioned(
        top: 22,
        right: 6,
        child: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.favorite_border_outlined,
            color: AppColor.secondary,
            size: 26,
          ),
        ),
      ),
      Positioned.fill(
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  AppColor.black,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.3, 0.5]),
          ),
        ),
      )
    ];
  }
}
