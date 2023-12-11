import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movieapp_flutter/common/super_scaffold.dart';
import 'package:movieapp_flutter/utils/app_colors.dart';
import 'package:movieapp_flutter/utils/app_values.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SuperScaffold(
      topColor: AppColor.black,
      child: Scaffold(
        backgroundColor: AppColor.black,
        body: Padding(
          padding: EdgeInsets.only(left: 4.w, top: 2.w, right: 3.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome to',
                style: TextStyle(
                  color: AppColor.white,
                  fontSize: AppValues.mediumText,
                ),
              ),
              SizedBox(
                height: 2.w,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Cine Plus',
                    style: TextStyle(
                        color: AppColor.white, fontSize: AppValues.largeText),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Icon(
                        Icons.search,
                        color: AppColor.white,
                        // size: 6.w,
                      ),
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 8.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Popular Movies',
                      style: TextStyle(
                          color: AppColor.white,
                          fontWeight: FontWeight.bold,
                          fontSize: AppValues.smallText),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'See All',
                        style: TextStyle(
                          color: AppColor.primary,
                          fontSize: AppValues.extraSmallText,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: CarouselSlider.builder(
                  itemCount: 10,
                  options: CarouselOptions(
                    height: 300,
                    // aspectRatio: 1 / .9,
                    viewportFraction: 0.7,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 2),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    pageSnapping: true,
                  ),
                  itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) =>
                      Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),

                    margin: const EdgeInsets.symmetric(horizontal: 1),
                    width: 250,
                    height: 300,
                    // color: AppColor.primary,
                    child: Image.asset(
                      'assets/images/cat.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
