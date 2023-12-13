import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:movieapp_flutter/controller/movie_detail_controller.dart';
import 'package:movieapp_flutter/utils/app_values.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/app_colors.dart';

class PopularDetailScreen extends StatelessWidget {
  final String movieId;
  const PopularDetailScreen({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var statusController = Get.find<MovieDetailController>();
      statusController.getMovieDetail(movieId);
    });
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ));
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: GetBuilder<MovieDetailController>(
        builder: (MovieDetailController controller) {
          return Stack(
            children: [
              ..._buildBackground(context, controller),
              _buildMovieInformation(context, controller),
              Positioned(
                top: 30,
                child: IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(
                    CupertinoIcons.chevron_back,
                    color: AppColor.white,
                    size: 26,
                  ),
                ),
              ),
              Positioned(
                top: 30,
                right: 6,
                child: IconButton(
                  onPressed: () => print('Favorite'),
                  icon: Icon(
                    Icons.favorite_border_outlined,
                    color: AppColor.secondary,
                    size: 26,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Positioned _buildMovieInformation(
      BuildContext context, MovieDetailController controller) {
    return Positioned(
      bottom: 150,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Text(
            "${controller.movieDetailData?.originalTitle}",
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
            "${controller.movieDetailData?.status}"
            " | "
            "${controller.movieDetailData?.releaseDate}"
            " | "
            "${controller.movieDetailData?.runtime} min",
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
              "${controller.movieDetailData?.overview}",
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

  List<Widget> _buildBackground(
      BuildContext context, MovieDetailController controller) {
    return [
      Container(
        height: double.infinity,
        color: AppColor.black,
      ),
      CachedNetworkImage(
        imageUrl:
            'https://image.tmdb.org/t/p/w500/${controller.movieDetailData?.backdropPath}',
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.5,
        fit: BoxFit.cover,
        filterQuality: FilterQuality.high,
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
