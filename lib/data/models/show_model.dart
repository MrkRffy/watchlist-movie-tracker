import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Show {
  int id;
  int voteCount;

  double popularity;
  double voteAverage;

  String title;
  String originalTitle;
  String posterPath;
  String backdropPath;
  String releaseDate;
  String overview;
  String originalLanguage;

  List<int> genreIds;

  bool adult;
  bool video;

  Show({
    this.id,
    this.voteCount,
    this.popularity,
    this.voteAverage,
    this.title,
    this.originalTitle,
    this.posterPath,
    this.backdropPath,
    this.releaseDate,
    this.overview,
    this.originalLanguage,
    this.genreIds,
    this.adult,
    this.video,
  });

  factory Show.fromJson(Map<String, dynamic> json) => _$ShowFromJson(json);

  Map<String, dynamic> toJson() => _$ShowToJson(this);
}
