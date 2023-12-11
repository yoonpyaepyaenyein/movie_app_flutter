import 'dart:convert';

import 'package:get/get.dart';
import 'package:movieapp_flutter/model/movie_list.dart';
import 'package:movieapp_flutter/services/movie_api_service.dart';
import 'package:http/http.dart' as http;

enum ApiStatus { initial, loading, succeed, failure }

class MovieController extends GetxController {
  int pageSize = 10;
  ApiStatus fetchLoadingStatus = ApiStatus.initial;
  MovieList? movieData;

  @override
  void onInit() {
    // TODO: implement onInit
    getMovies();
    super.onInit();
  }

  void getMovies() async {
    fetchLoadingStatus = ApiStatus.loading;
    update();

    try {
      http.Response response = await MovieApiService.getMovies(
          language: 'en-US', page: pageSize.toString());
      // print('RESPONSE ___________, ${response.body}');
      fetchLoadingStatus = ApiStatus.succeed;

      var result = jsonDecode(response.body);
      MovieList movieList = MovieList.fromJson(result);
      movieData = movieList;
      print('Movie List is ______, ${movieData?.results}');
      update();

      print('Result is ______, $result');
    } catch (e) {
      print(e.toString());
      fetchLoadingStatus = ApiStatus.failure;
      update();
    }
  }
}
