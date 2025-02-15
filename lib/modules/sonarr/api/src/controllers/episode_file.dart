part of sonarr_commands;

/// Facilitates, encapsulates, and manages individual calls related to episode files within Sonarr.
///
/// [SonarrControllerEpisodeFile] internally handles routing the HTTP client to the API calls.
class SonarrControllerEpisodeFile {
  final Dio _client;

  /// Create a series command handler using an initialized [Dio] client.
  SonarrControllerEpisodeFile(this._client);

  /// Handler for [episodefile/{id}](https://github.com/Sonarr/Sonarr/wiki/EpisodeFile#delete).
  ///
  /// Delete the given episode file.
  ///
  /// Required Parameters:
  /// - `episodeFileId`: Episode ID for the episode to fetch
  Future<void> delete({
    required int episodeFileId,
  }) async =>
      _commandDeleteEpisodeFile(_client, episodeFileId: episodeFileId);

  /// Handler for [episodefile/{id}](https://github.com/Sonarr/Sonarr/wiki/EpisodeFile#get).
  ///
  /// Returns the episode file with the matching episode ID.
  ///
  /// Required Parameters:
  /// - `episodeId`: Episode ID for the episode to fetch
  Future<SonarrEpisodeFile> get({
    required int episodeId,
  }) async =>
      _commandGetEpisodeFile(_client, episodeId: episodeId);

  /// Handler for [episodefile?seriesid={id}](https://github.com/Sonarr/Sonarr/wiki/EpisodeFile#getid).
  ///
  /// Returns all episode files for the given series.
  ///
  /// Required Parameters:
  /// - `seriesId`: Series ID for which to fetch episodes for
  Future<List<SonarrEpisodeFile>> getSeries({
    required int seriesId,
  }) async =>
      _commandGetSeriesEpisodeFiles(_client, seriesId: seriesId);
}
