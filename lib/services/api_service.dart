import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:netflix_ui/models/genre.dart';

import 'api_data.dart';

class ApiManager {
  Future<Movie> getGenre() async {
    var client = http.Client();
    var listOfGenre;
    try {
      var response = await client.get(Uri.parse(Api.listUrl));
      if (response.statusCode == 200) {
        var jsonData = response.body;
        var categories = json.decode(jsonData);

        listOfGenre = Movie.fromJson(categories);
      }
    } on Exception catch (_) {
     throw Exception('Something went wrong');
    }
    return listOfGenre;
  }

  //  movie page home

  Future getVideos(int id) async {
    final response = await http.get(Uri.parse(
        Api.apiUrl +
            'movie/' +
            id.toString() +
            '/videos?api_key=' +
            Api.apiKey +
            '&language=en-US'));
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      return jsonData['results'][0]['key'];
    } else {
      throw Exception('Something went wrong!');
    }
  }

  Future getVideoDetails(int id) async {
    final response = await http.get(Uri.parse(Api.apiUrl +
        'movie/' +
        id.toString() +
        '?api_key=' +
        Api.apiKey +
        '&language=en-US'));
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      return jsonData;
    } else {
      throw Exception('Something went wrong');
    }
  }
}
