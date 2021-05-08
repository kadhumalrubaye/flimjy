import 'dart:convert';

SeriesModel seriesFromJson(String str) =>
    SeriesModel.fromJson(json.decode(str));

String seriesToJson(SeriesModel data) => json.encode(data.toJson());

class SeriesModel {
  SeriesModel({
    this.backdropPath,
    this.firstAirDate,
    this.genreIds,
    this.id,
    this.name,
    this.originCountry,
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.popularity,
    this.posterPath,
    this.voteAverage,
    this.voteCount,
  });

  String backdropPath;
  DateTime firstAirDate;
  List<int> genreIds;
  int id;
  String name;
  List<OriginCountry> originCountry;
  OriginalLanguage originalLanguage;
  String originalName;
  String overview;
  double popularity;
  String posterPath;
  double voteAverage;
  int voteCount;

  factory SeriesModel.fromJson(Map<String, dynamic> json) => SeriesModel(
        backdropPath: json["backdrop_path"],
        firstAirDate: DateTime.parse(json["first_air_date"]),
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        name: json["name"],
        originCountry: List<OriginCountry>.from(
            json["origin_country"].map((x) => originCountryValues.map[x])),
        originalLanguage: originalLanguageValues.map[json["original_language"]],
        originalName: json["original_name"],
        overview: json["overview"],
        popularity: json["popularity"].toDouble(),
        posterPath: json["poster_path"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
      );

  Map<String, dynamic> toJson() => {
        "backdrop_path": backdropPath,
        "first_air_date":
            "${firstAirDate.year.toString().padLeft(4, '0')}-${firstAirDate.month.toString().padLeft(2, '0')}-${firstAirDate.day.toString().padLeft(2, '0')}",
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "id": id,
        "name": name,
        "origin_country": List<dynamic>.from(
            originCountry.map((x) => originCountryValues.reverse[x])),
        "original_language": originalLanguageValues.reverse[originalLanguage],
        "original_name": originalName,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };
}

enum OriginCountry { US, MX, FR }

final originCountryValues = EnumValues(
    {"FR": OriginCountry.FR, "MX": OriginCountry.MX, "US": OriginCountry.US});

enum OriginalLanguage { EN, ES, FR }

final originalLanguageValues = EnumValues({
  "en": OriginalLanguage.EN,
  "es": OriginalLanguage.ES,
  "fr": OriginalLanguage.FR
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
