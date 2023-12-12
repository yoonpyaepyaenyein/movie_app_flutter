import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp_flutter/view/popular/popular_detail_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../common/super_scaffold.dart';
import '../../controller/movie_controller.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_values.dart';

class PopularScreen extends StatelessWidget {
  const PopularScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SuperScaffold(
      child: Scaffold(
        backgroundColor: AppColor.black,
        body: GetBuilder<MovieController>(
          builder: (MovieController controller) {
            return Column(
              children: [
                _headerWidget(),
                controller.fetchLoadingStatus != ApiStatus.loading
                    ? NotificationListener<ScrollEndNotification>(
                        onNotification: (scrollInfo) {
                          if (scrollInfo.metrics.pixels ==
                              scrollInfo.metrics.maxScrollExtent) {
                            controller.getMoreMovies();
                          }
                          return true;
                        },
                        child: _popularMovieList(controller),
                      )
                    : Center(
                        child: Text(
                          'Loading',
                          style: TextStyle(color: AppColor.white),
                        ),
                      ),
                controller.fetchMoreLoadingStatus == ApiStatus.loading
                    ? const CupertinoActivityIndicator()
                    : const SizedBox.shrink()
              ],
            );
          },
        ),
      ),
    );
  }

  Row _headerWidget() {
    return Row(
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
              color: AppColor.white, fontWeight: FontWeight.bold, fontSize: 16),
        )
      ],
    );
  }

  Expanded _popularMovieList(MovieController controller) {
    return Expanded(
      child: CustomScrollView(
        // primary: false,
        slivers: <Widget>[
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 3.w),
            sliver: SliverGrid.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 310,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 10),
              itemCount: controller.movieData?.results?.length,
              itemBuilder: (BuildContext context, int index) {
                final individualMovieData =
                    controller.movieData?.results?[index];
                return GestureDetector(
                  onTap: () => Get.to(
                    const PopularDetailScreen(),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 3.w),
                    child: Column(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CachedNetworkImage(
                              imageUrl:
                                  'https://image.tmdb.org/t/p/w500/${individualMovieData?.posterPath}',
                              fit: BoxFit.cover,
                            )),
                        SizedBox(
                          height: 3.w,
                        ),
                        Text(
                          '${individualMovieData?.originalTitle}',
                          style: TextStyle(
                              color: AppColor.white,
                              fontWeight: FontWeight.w500,
                              fontSize: AppValues.extraSmallText),
                        ),
                        Text(
                          '${individualMovieData?.releaseDate}',
                          style: TextStyle(
                              color: AppColor.secondary,
                              fontWeight: FontWeight.w200,
                              fontSize: AppValues.extraSmallText),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
