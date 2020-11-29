import 'package:json_annotation/json_annotation.dart';
import 'package:watchlist/constants/images.dart';

part 'movie_model.g.dart';

@JsonSerializable()
class Movie {
  int id;
  @JsonKey(name: 'vote_count')
  int voteCount;
  int budget;
  int revenue;
  int runtime;

  double popularity;
  @JsonKey(name: 'vote_average')
  double voteAverage;

  String title;
  @JsonKey(name: 'original_title')
  String originalTitle;
  @JsonKey(name: 'poster_path')
  String posterPath;
  @JsonKey(name: 'backdrop_path')
  String backdropPath;
  @JsonKey(name: 'release_date')
  String releaseDate;
  String overview;
  @JsonKey(name: 'original_language')
  String originalLanguage;
  String status;

  List<int> genreIds;
  @JsonKey(name: 'production_companies')
  List<Object> productionCompanies;
  @JsonKey(name: 'production_countries')
  List<Object> productionCountries;
  @JsonKey(name: 'spoken_languages')
  List<Object> spokenLanguages;

  bool adult;
  bool video;

  Movie({
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

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);

  int getId() => this.id;

  String getTitle() => this.title;

  String getGenres() => "Crime, Drama, Thriller";

  bool hasPoster() => this.posterPath?.isNotEmpty;

  String getPosterUrl({size = PosterSize.ORIGINAL}) {
    return '$secureImageBaseUrl$size${this.posterPath}';
  }
}
