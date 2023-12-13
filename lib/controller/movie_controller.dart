import 'dart:convert';

import 'package:get/get.dart';
import 'package:movieapp_flutter/model/movie_list.dart';
import 'package:movieapp_flutter/services/movie_api_service.dart';
import 'package:http/http.dart' as http;

enum ApiStatus { initial, loading, succeed, failure }

class MovieController extends GetxController {
  int page = 1;
  ApiStatus fetchLoadingStatus = ApiStatus.initial;
  MovieList? movieData;
  ApiStatus fetchMoreLoadingStatus = ApiStatus.initial;

  @override
  void onInit() {
    // TODO: implement onInit
    getMovies();
    // getMoreMovies();
    super.onInit();
  }

  void getMovies() async {
    fetchLoadingStatus = ApiStatus.loading;
    update();

    try {
      http.Response response = await MovieApiService.getMovies(
          language: 'en-US', page: page.toString());
      print('RESPONSE ___________, ${response.body}');
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        MovieList movieList = MovieList.fromJson(result);
        movieData = movieList;
        fetchLoadingStatus = ApiStatus.succeed;

        print('Movie List is ______, ${movieData?.results?.length}');
        update();
      }
      // print('Result is ______, $result');
    } catch (e) {
      print(e.toString());
      fetchLoadingStatus = ApiStatus.failure;
      update();
    }
  }

  Future<void> getMoreMovies() async {
    fetchMoreLoadingStatus = ApiStatus.loading;
    update();

    try {
      page += 1;

      http.Response response = await MovieApiService.getMovies(
          language: 'en-US', page: page.toString());

      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        MovieList movieList = MovieList.fromJson(result);
        // print('Pagination Movie List is ______, ${movieData?.results?.length}');
        // movieData?.results = movieData?.results
        //   ?..addAll(movieList.results ?? []);
        movieData?.results = movieData?.results
          ?..addAll(movieList.results ?? []);

        // print(
        // 'Movie Data is___________ ${movieData?.results?.map((e) => e.originalTitle)}');

        fetchMoreLoadingStatus = ApiStatus.succeed;
        update();
      }
    } catch (e) {
      print(e.toString());
      fetchMoreLoadingStatus = ApiStatus.failure;
      update();
    }
  }
}
