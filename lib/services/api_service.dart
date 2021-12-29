import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:netflix_ui/models/genre.dart';

import 'api_data.dart';

class ApiManager {
  Future<Movie> getGenre() async {
    var client = http.Client();
    var listOfGenre = null;
    try {
      var response = await client.get(Uri.parse(Api.listUrl));
      if (response.statusCode == 200) {
        var jsonData = response.body;
        var categories = json.decode(jsonData);

        listOfGenre = Movie.fromJson(categories);
        print('list $listOfGenre');
      }
    } on Exception catch (e) {
      print(Exception(e));
    }
    return listOfGenre;
  }
}
