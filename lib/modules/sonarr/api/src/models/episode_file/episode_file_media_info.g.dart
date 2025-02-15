// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode_file_media_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SonarrEpisodeFileMediaInfo _$SonarrEpisodeFileMediaInfoFromJson(
        Map<String, dynamic> json) =>
    SonarrEpisodeFileMediaInfo(
      audioBitrate: json['audioBitrate'] as int?,
      audioChannels: (json['audioChannels'] as num?)?.toDouble(),
      audioCodec: json['audioCodec'] as String?,
      audioLanguages: json['audioLanguages'] as String?,
      audioStreamCount: json['audioStreamCount'] as int?,
      videoBitDepth: json['videoBitDepth'] as int?,
      videoBitrate: json['videoBitrate'] as int?,
      videoCodec: json['videoCodec'] as String?,
      videoFps: (json['videoFps'] as num?)?.toDouble(),
      resolution: json['resolution'] as String?,
      runTime: json['runTime'] as String?,
      scanType: json['scanType'] as String?,
      subtitles: json['subtitles'] as String?,
    );

Map<String, dynamic> _$SonarrEpisodeFileMediaInfoToJson(
    SonarrEpisodeFileMediaInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('audioBitrate', instance.audioBitrate);
  writeNotNull('audioChannels', instance.audioChannels);
  writeNotNull('audioCodec', instance.audioCodec);
  writeNotNull('audioLanguages', instance.audioLanguages);
  writeNotNull('audioStreamCount', instance.audioStreamCount);
  writeNotNull('videoBitDepth', instance.videoBitDepth);
  writeNotNull('videoBitrate', instance.videoBitrate);
  writeNotNull('videoCodec', instance.videoCodec);
  writeNotNull('videoFps', instance.videoFps);
  writeNotNull('resolution', instance.resolution);
  writeNotNull('runTime', instance.runTime);
  writeNotNull('scanType', instance.scanType);
  writeNotNull('subtitles', instance.subtitles);
  return val;
}
