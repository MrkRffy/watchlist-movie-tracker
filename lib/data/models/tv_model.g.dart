// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TV _$TVFromJson(Map<String, dynamic> json) {
  return TV(
    id: json['id'] as int,
    voteCount: json['vote_count'] as int,
    popularity: (json['popularity'] as num)?.toDouble(),
    voteAverage: (json['vote_average'] as num)?.toDouble(),
    title: json['title'] as String,
    originalTitle: json['original_title'] as String,
    posterPath: json['poster_path'] as String,
    backdropPath: json['backdrop_path'] as String,
    overview: json['overview'] as String,
    originalLanguage: json['original_language'] as String,
    adult: json['adult'] as bool,
    video: json['video'] as bool,
    mediaType: json['media_type'] as String,
    releaseDate: json['release_date'] as String,
  )
    ..name = json['name'] as String
    ..originalName = json['original_name'] as String
    ..genreIds = (json['genreIds'] as List)?.map((e) => e as int)?.toList()
    ..budget = json['budget'] as int
    ..genres = json['genres'] as List
    ..imdbId = json['imdb_id'] as String;
}

Map<String, dynamic> _$TVToJson(TV instance) => <String, dynamic>{
      'id': instance.id,
      'vote_count': instance.voteCount,
      'popularity': instance.popularity,
      'vote_average': instance.voteAverage,
      'title': instance.title,
      'name': instance.name,
      'original_title': instance.originalTitle,
      'original_name': instance.originalName,
      'poster_path': instance.posterPath,
      'backdrop_path': instance.backdropPath,
      'overview': instance.overview,
      'original_language': instance.originalLanguage,
      'media_type': instance.mediaType,
      'genreIds': instance.genreIds,
      'adult': instance.adult,
      'video': instance.video,
      'budget': instance.budget,
      'genres': instance.genres,
      'release_date': instance.releaseDate,
      'imdb_id': instance.imdbId,
    };
