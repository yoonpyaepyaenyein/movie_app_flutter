import 'package:http/http.dart';
import 'package:movieapp_flutter/services/api_service.dart';

class MovieDetailApiService {
  static Future<Response> getMovieDetail({
    required String language,
    required String movieId,
  }) async {
    Response response = await ApiService.get(
      endPoint: '/3/movie/$movieId',
      query: {
        "language": language,
        "api_key": "625a3cb291fc8eb4f0afa7b3d8c93ba6"
      },
    );
    print('Movie Detail Response is ____________, $response');
    return response;
  }
}
