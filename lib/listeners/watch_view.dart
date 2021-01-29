import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rabbit_clicker/models/game_model.dart';

class WatchView extends StatefulWidget {
  @override
  _WatchViewState createState() => _WatchViewState();
}

class _WatchViewState extends State<WatchView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<RabbitClicker>(
      builder: (context, gameModel, child) {
        return Text(
          " Time: ${"${_printDuration(gameModel.timeElapsed)}"}",
          style: TextStyle(fontSize: 20),
        );
      },
    );
  }
}

String _printDuration(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, "0");
  String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
  String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
  return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
}
