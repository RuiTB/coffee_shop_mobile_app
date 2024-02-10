// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegisterResponseImpl _$$RegisterResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$RegisterResponseImpl(
      id: json['id'] as int?,
      token: json['token'] as String?,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$$RegisterResponseImplToJson(
    _$RegisterResponseImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('token', instance.token);
  writeNotNull('error', instance.error);
  return val;
}
