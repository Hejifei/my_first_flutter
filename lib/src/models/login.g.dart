// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Login _$LoginFromJson(Map<String, dynamic> json) => Login(
      json['account'] as String,
      json['isEnable'] as bool,
      json['isIot'] as bool,
      json['server'],
      json['token'],
    );

Map<String, dynamic> _$LoginToJson(Login instance) => <String, dynamic>{
      'account': instance.account,
      'isEnable': instance.isEnable,
      'isIot': instance.isIot,
      'server': instance.server,
      'token': instance.token,
    };
