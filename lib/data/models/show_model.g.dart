// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Show _$ShowFromJson(Map<String, dynamic> json) {
  return Show(
    id: json['id'] as int,
    voteCount: json['vote_count'] as int,
    popularity: (json['popularity'] as num)?.toDouble(),
    voteAverage: (json['vote_average'] as num)?.toDouble(),
    title: json['title'] as String,
    name: json['name'] as String,
    originalTitle: json['original_title'] as String,
    posterPath: json['poster_path'] as String,
    backdropPath: json['backdrop_path'] as String,
    overview: json['overview'] as String,
    originalLanguage: json['original_language'] as String,
    genreIds: (json['genreIds'] as List)?.map((e) => e as int)?.toList(),
    adult: json['adult'] as bool,
    video: json['video'] as bool,
    mediaType: json['media_type'] as String,
  )..originalName = json['original_name'] as String;
}

Map<String, dynamic> _$ShowToJson(Show instance) => <String, dynamic>{
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
    };
