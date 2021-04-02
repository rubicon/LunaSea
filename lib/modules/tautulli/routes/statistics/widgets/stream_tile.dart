import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lunasea/core.dart';

class TautulliStatisticsStreamTile extends StatelessWidget {
    final Map<String, dynamic> data;
    final double _imageDimension = 83.0;
    final double _padding = 8.0;

    TautulliStatisticsStreamTile({
        Key key,
        @required this.data,
    }) : super(key: key);

    @override
    Widget build(BuildContext context) => LunaCard(
        context: context,
        child: Row(
            children: [
                _placeholder,
                _details(context),
            ],
        ),
    );

    Widget get _placeholder => Container(
        height: _imageDimension,
        width: _imageDimension/1.5,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(LunaUI.BORDER_RADIUS),
            image: DecorationImage(
                image: AssetImage('assets/images/blanks/stream.png'),
                fit: BoxFit.cover,
            ),
        ),
    );

    Widget _details(BuildContext context) => Expanded(
        child: Padding(
            child: Container(
                child: Column(
                    children: [
                        _title,
                        _subtitle(context),
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                ),
                height: (_imageDimension-(_padding*2)),
            ),
            padding: EdgeInsets.all(_padding),
        ),
    );

    Widget get _title => LunaText.title(
        text: data['title'] ?? 'Unknown Title',
        maxLines: 1,
    );

    Widget _subtitle(BuildContext context) => RichText(
        text: TextSpan(
            style: TextStyle(
                color: Colors.white70,
                fontSize: LunaUI.FONT_SIZE_SUBTITLE,
            ),
            children: <TextSpan>[
                TextSpan(
                    text: data['count'].toString() + (data['count'] == 1 ? ' Play' : ' Plays'),
                    style: TextStyle(
                        color: LunaColours.accent,
                        fontWeight: LunaUI.FONT_WEIGHT_BOLD,
                    ),
                ),
                TextSpan(text: '\n'),
                int.tryParse(data['started']) != null
                    ? TextSpan(
                        text: LunaDatabaseValue.USE_24_HOUR_TIME.data
                            ? DateFormat('yyyy-MM-dd HH:mm').format(DateTime.fromMillisecondsSinceEpoch(int.tryParse(data['started']) * 1000))
                            : DateFormat('yyyy-MM-dd hh:mm a').format(DateTime.fromMillisecondsSinceEpoch(int.tryParse(data['started']) * 1000)),
                    )
                    : TextSpan(text: '${LunaUI.TEXT_EMDASH}'),
                TextSpan(text: '\n'),
                data['last_play'] != null
                    ? TextSpan(text: 'Last Used ' + DateTime.fromMillisecondsSinceEpoch(data['last_play']*1000)?.lunaAge ?? 'Unknown')
                    : TextSpan(text: LunaUI.TEXT_EMDASH)
            ],
        ),
        softWrap: false,
        maxLines: 3,
        overflow: TextOverflow.fade,
    );
}
