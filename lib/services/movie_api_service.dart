import 'package:http/http.dart';
import 'package:movieapp_flutter/services/api_service.dart';

class MovieApiService {
  static Future<Response> getMovies(
      {required String language, required String page}) async {
    Response response = await ApiService.get(
        endPoint: '/3/movie/popular',
        query: {
          "language": "en-US",
          "page": page,
          "api_key": "625a3cb291fc8eb4f0afa7b3d8c93ba6"
        });
    print('Response data is $response');
    return response;
  }
}
