import 'package:json_annotation/json_annotation.dart';
import 'package:watchlist/data/models/show_model.dart';

part 'tv_model.g.dart';

@JsonSerializable()
class TV extends Show {
  int budget;
  List<Object> genres;

  @JsonKey(name: 'release_date')
  String releaseDate;
  @JsonKey(name: 'imdb_id')
  String imdbId;

  TV({
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
          mediaType: 'tv',
        );

  factory TV.fromJson(Map<String, dynamic> json) => _$TVFromJson(json);
  Map<String, dynamic> toJson() => _$TVToJson(this);
}
