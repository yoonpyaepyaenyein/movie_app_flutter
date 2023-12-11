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
              )
            ],
          ),
        ),
      ),
    );
  }
}
