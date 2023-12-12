import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:movieapp_flutter/common/super_scaffold.dart';
import 'package:movieapp_flutter/utils/app_colors.dart';
import 'package:movieapp_flutter/utils/app_values.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PopularScreen extends StatelessWidget {
  const PopularScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SuperScaffold(
      child: Scaffold(
        backgroundColor: AppColor.black,
        body: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: AppColor.white,
                  ),
                ),
                Text(
                  'Popular Movies',
                  style: TextStyle(
                      color: AppColor.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                )
              ],
            ),
            Expanded(
              child: CustomScrollView(
                // primary: false,
                slivers: <Widget>[
                  SliverPadding(
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 3.w),
                    sliver: SliverGrid.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisExtent: 290,
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 10),
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          // width: 40.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            // color: AppColor.grey,
                          ),
                          margin: EdgeInsets.symmetric(horizontal: 3.w),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  'assets/images/cat.jpg',
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                              SizedBox(
                                height: 3.w,
                              ),
                              Text(
                                'Something',
                                style: TextStyle(
                                    color: AppColor.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: AppValues.smallText),
                              ),
                              Text(
                                '2023-11-17',
                                style: TextStyle(
                                    color: AppColor.secondary,
                                    fontWeight: FontWeight.w200,
                                    fontSize: AppValues.extraSmallText),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
