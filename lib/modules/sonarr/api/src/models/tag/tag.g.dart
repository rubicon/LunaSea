// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SonarrTag _$SonarrTagFromJson(Map<String, dynamic> json) => SonarrTag(
      id: json['id'] as int?,
      label: json['label'] as String?,
    );

Map<String, dynamic> _$SonarrTagToJson(SonarrTag instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('label', instance.label);
  return val;
}
