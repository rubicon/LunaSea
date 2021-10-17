import 'package:flutter/material.dart';
import 'package:lunasea/core.dart';
import 'package:lunasea/modules/sonarr.dart';

enum SonarrGlobalSettingsType {
  WEB_GUI,
  RUN_RSS_SYNC,
  SEARCH_ALL_MISSING,
  UPDATE_LIBRARY,
  BACKUP_DATABASE,
}

extension SonarrGlobalSettingsTypeExtension on SonarrGlobalSettingsType {
  IconData get icon {
    switch (this) {
      case SonarrGlobalSettingsType.WEB_GUI:
        return Icons.language;
      case SonarrGlobalSettingsType.UPDATE_LIBRARY:
        return Icons.autorenew;
      case SonarrGlobalSettingsType.RUN_RSS_SYNC:
        return Icons.rss_feed;
      case SonarrGlobalSettingsType.SEARCH_ALL_MISSING:
        return Icons.search;
      case SonarrGlobalSettingsType.BACKUP_DATABASE:
        return Icons.save;
    }
    throw Exception('Invalid SonarrGlobalSettingsType');
  }

  String get name {
    switch (this) {
      case SonarrGlobalSettingsType.WEB_GUI:
        return 'sonarr.ViewWebGUI'.tr();
      case SonarrGlobalSettingsType.UPDATE_LIBRARY:
        return 'sonarr.UpdateLibrary'.tr();
      case SonarrGlobalSettingsType.RUN_RSS_SYNC:
        return 'sonarr.RunRSSSync'.tr();
      case SonarrGlobalSettingsType.SEARCH_ALL_MISSING:
        return 'sonarr.SearchAllMissing'.tr();
      case SonarrGlobalSettingsType.BACKUP_DATABASE:
        return 'sonarr.BackupDatabase'.tr();
    }
    throw Exception('Invalid SonarrGlobalSettingsType');
  }

  Future<void> execute(BuildContext context) async {
    switch (this) {
      case SonarrGlobalSettingsType.WEB_GUI:
        return _webGUI(context);
      case SonarrGlobalSettingsType.RUN_RSS_SYNC:
        return; // TODO: Implement handler
      case SonarrGlobalSettingsType.SEARCH_ALL_MISSING:
        return; // TODO: Implement handler
      case SonarrGlobalSettingsType.UPDATE_LIBRARY:
        return; // TODO: Implement handler
      case SonarrGlobalSettingsType.BACKUP_DATABASE:
        return; // TODO: Implement handler
    }
    throw Exception('Invalid RadarrGlobalSettingsType');
  }

  Future<void> _webGUI(BuildContext context) async =>
      context.read<SonarrState>().host.lunaOpenGenericLink(
            headers: context.read<SonarrState>().headers,
          );
}
