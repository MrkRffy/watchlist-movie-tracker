// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'series_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) {
  return Movie(
    id: json['id'] as int,
    voteCount: json['vote_count'] as int,
    popularity: (json['popularity'] as num)?.toDouble(),
    voteAverage: (json['vote_average'] as num)?.toDouble(),
    title: json['title'] as String,
    originalTitle: json['original_title'] as String,
    posterPath: json['poster_path'] as String,
    backdropPath: json['backdrop_path'] as String,
    releaseDate: json['release_date'] as String,
    overview: json['overview'] as String,
    originalLanguage: json['original_language'] as String,
    genreIds: (json['genreIds'] as List)?.map((e) => e as int)?.toList(),
    adult: json['adult'] as bool,
    video: json['video'] as bool,
  );
}

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'id': instance.id,
      'vote_count': instance.voteCount,
      'popularity': instance.popularity,
      'vote_average': instance.voteAverage,
      'title': instance.title,
      'original_title': instance.originalTitle,
      'poster_path': instance.posterPath,
      'backdrop_path': instance.backdropPath,
      'release_date': instance.releaseDate,
      'overview': instance.overview,
      'original_language': instance.originalLanguage,
      'genreIds': instance.genreIds,
      'adult': instance.adult,
      'video': instance.video,
    };
