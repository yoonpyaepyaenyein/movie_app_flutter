import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _baseUrl = 'api.themoviedb.org';

  static Future<Response> get(
      {required String endPoint, required Map<String, String> query}) async {
    final request = Uri.https(_baseUrl, endPoint, query, );

    Response response = await http.get(request);
    print('Url is $request');

    return response;
  }
}
