import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:movieapp_flutter/model/movie_detail/movie_detail.dart';
import 'package:movieapp_flutter/services/movie_detail_api_service.dart';

enum ApiStatus { initial, loading, succeed, failure }

class MovieDetailController extends GetxController {
  ApiStatus fetchLoadingStatus = ApiStatus.initial;
  MovieDetail? movieDetailData;

  void getMovieDetail(String movieId) async {
    fetchLoadingStatus = ApiStatus.loading;
    update();

    try {
      http.Response response = await MovieDetailApiService.getMovieDetail(
        language: 'en-US',
        movieId: movieId,
      );
      print('RESPONSE ___________, ${response.body}');
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        MovieDetail movieDetail = MovieDetail.fromJson(result);
        movieDetailData = movieDetail;
        fetchLoadingStatus = ApiStatus.succeed;
        update();
      }
    } catch (e) {
      print(e.toString());
      fetchLoadingStatus = ApiStatus.failure;
      update();
    }
  }
}
