import 'package:json_annotation/json_annotation.dart';
import 'package:watchlist/constants/images.dart';

part 'show_model.g.dart';

@JsonSerializable()
class Show {
  int id;
  @JsonKey(name: 'vote_count')
  int voteCount;

  double popularity;
  @JsonKey(name: 'vote_average')
  double voteAverage;

  String title;
  String name;
  @JsonKey(name: 'original_title')
  String originalTitle;
  @JsonKey(name: 'original_name')
  String originalName;
  @JsonKey(name: 'poster_path')
  String posterPath;
  @JsonKey(name: 'backdrop_path')
  String backdropPath;
  String overview;
  @JsonKey(name: 'original_language')
  String originalLanguage;
  @JsonKey(name: 'media_type')
  String mediaType;

  List<int> genreIds;

  bool adult;
  bool video;

  Show({
    this.id,
    this.voteCount,
    this.popularity,
    this.voteAverage,
    this.title,
    this.name,
    this.originalTitle,
    this.posterPath,
    this.backdropPath,
    this.overview,
    this.originalLanguage,
    this.genreIds,
    this.adult,
    this.video,
    this.mediaType,
  });

  factory Show.fromJson(Map<String, dynamic> json) => _$ShowFromJson(json);

  Map<String, dynamic> toJson() => _$ShowToJson(this);

  String get showTitle => this.title ?? this.name ?? '';

  String get rawMediaType => this.mediaType ?? '';

  String get type => this.mediaType == 'movie' ? 'Movie' : 'TV Show';

  bool get hasPoster => this.posterPath == null ? false : true;

  String getPosterUrl({size = PosterSize.ORIGINAL}) {
    return '$secureImageBaseUrl$size${this.posterPath}';
  }
}
