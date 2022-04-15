// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

News _$NewsFromJson(Map<String, dynamic> json) => News(
      json['title'] as String,
      json['shareUrl'] as String,
      json['author'] as String,
      json['itemCover'] as String,
      json['hotValue'] as int,
      json['hotWords'] as String,
      json['playCount'] as int,
      json['diggCount'] as int,
      json['commentCount'] as int,
    );

Map<String, dynamic> _$NewsToJson(News instance) => <String, dynamic>{
      'title': instance.title,
      'shareUrl': instance.shareUrl,
      'author': instance.author,
      'itemCover': instance.itemCover,
      'hotValue': instance.hotValue,
      'hotWords': instance.hotWords,
      'playCount': instance.playCount,
      'diggCount': instance.diggCount,
      'commentCount': instance.commentCount,
    };
