import 'package:flutter/material.dart';

import 'package:lunasea/core.dart';
import 'package:lunasea/modules/settings.dart';
import 'package:lunasea/router/routes/settings.dart';
import 'package:lunasea/system/filesystem/filesystem.dart';
import 'package:lunasea/types/log_type.dart';

class SystemLogsRoute extends StatefulWidget {
  const SystemLogsRoute({
    Key? key,
  }) : super(key: key);

  @override
  State<SystemLogsRoute> createState() => _State();
}

class _State extends State<SystemLogsRoute> with LunaScrollControllerMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return LunaScaffold(
      scaffoldKey: _scaffoldKey,
      appBar: _appBar(),
      body: _body(),
      bottomNavigationBar: _bottomActionBar(),
    );
  }

  PreferredSizeWidget _appBar() {
    return LunaAppBar(
      title: 'settings.Logs'.tr(),
      scrollControllers: [scrollController],
    );
  }

  Widget _bottomActionBar() {
    return LunaBottomActionBar(
      actions: [
        _exportLogs(),
        _clearLogs(),
      ],
    );
  }

  Widget _body() {
    return LunaListView(
      controller: scrollController,
      children: [
        LunaBlock(
          title: 'settings.AllLogs'.tr(),
          body: [TextSpan(text: 'settings.AllLogsDescription'.tr())],
          trailing: const LunaIconButton(icon: Icons.developer_mode_rounded),
          onTap: () async => _viewLogs(null),
        ),
        ...List.generate(
          LunaLogType.values.length,
          (index) {
            if (LunaLogType.values[index].enabled)
              return LunaBlock(
                title: LunaLogType.values[index].title,
                body: [TextSpan(text: LunaLogType.values[index].description)],
                trailing: LunaIconButton(icon: LunaLogType.values[index].icon),
                onTap: () async => _viewLogs(LunaLogType.values[index]),
              );
            return Container(height: 0.0);
          },
        ),
      ],
    );
  }

  Future<void> _viewLogs(LunaLogType? type) async {
    SettingsRoutes.SYSTEM_LOGS_DETAILS.go(params: {
      'type': type?.key ?? 'all',
    });
  }

  Widget _clearLogs() {
    return LunaButton.text(
      text: 'settings.Clear'.tr(),
      icon: LunaIcons.DELETE,
      color: LunaColours.red,
      onTap: () async {
        bool result = await SettingsDialogs().clearLogs(context);
        if (result) {
          LunaLogger().clear();
          showLunaSuccessSnackBar(
            title: 'settings.LogsCleared'.tr(),
            message: 'settings.LogsClearedDescription'.tr(),
          );
        }
      },
    );
  }

  Widget _exportLogs() {
    return Builder(
      builder: (context) => LunaButton.text(
        text: 'settings.Export'.tr(),
        icon: LunaIcons.DOWNLOAD,
        onTap: () async {
          String data = await LunaLogger().export();
          bool result = await LunaFileSystem()
              .save(context, 'logs.json', utf8.encode(data));
          if (result)
            showLunaSuccessSnackBar(
                title: 'settings.ExportedLogs'.tr(),
                message: 'settings.ExportedLogsMessage'.tr());
        },
      ),
    );
  }
}
