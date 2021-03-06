import 'package:json_annotation/json_annotation.dart';
import 'package:watchlist/data/models/show_model.dart';

part 'movie_model.g.dart';

@JsonSerializable()
class Movie extends Show {
  int budget;
  List<Object> genres;

  @JsonKey(name: 'release_date')
  String releaseDate;
  @JsonKey(name: 'imdb_id')
  String imdbId;

  Movie({
    int id,
    int voteCount,
    double popularity,
    double voteAverage,
    String title,
    String originalTitle,
    String posterPath,
    String backdropPath,
    String overview,
    String originalLanguage,
    bool adult,
    bool video,
    String mediaType,
    this.releaseDate,
  }) : super(
          id: id,
          voteCount: voteCount,
          popularity: popularity,
          voteAverage: voteAverage,
          title: title,
          originalTitle: originalTitle,
          posterPath: posterPath,
          backdropPath: backdropPath,
          overview: overview,
          originalLanguage: originalLanguage,
          adult: adult,
          video: video,
          mediaType: 'movie',
        );

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
  Map<String, dynamic> toJson() => _$MovieToJson(this);
}
