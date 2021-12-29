
import 'dart:convert';

Movie movieFromJson(String str) => Movie.fromJson(json.decode(str));

String movieToJson(Movie data) => json.encode(data.toJson());

class Movie {
  Movie({
    required this.genres,
  });

  final List<Genre>  genres;

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
    genres: List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
  };
}

class Genre {
  Genre({

    required this.name,
  });

  final String name;

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {

    "name": name,
  };
}