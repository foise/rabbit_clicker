import 'package:flutter/material.dart';
import 'package:rabbit_clicker/models/game_model.dart';
import 'package:provider/provider.dart';

class PauseButton extends StatefulWidget {
  @override
  _PauseButtonState createState() => _PauseButtonState();
}

class _PauseButtonState extends State<PauseButton> {
  IconData iconData = Icons.pause;
  @override
  Widget build(BuildContext context) {
    return Consumer<RabbitClicker>(
      builder: (context, gameModel, child) {
        return GestureDetector(
          onTapDown: (TapDownDetails details) {
            if (gameModel.pause) {
              gameModel.startTimer();
              gameModel.setPause();
              setState(() {
                iconData = Icons.pause;
              });
            } else {
              gameModel.stopTimer();
              gameModel.setPause();
              setState(() {
                iconData = Icons.play_arrow;
              });
            }
          },
          child: Container(
            width: 30,
            height: 30,
            child: Icon(iconData),
          ),
        );
      },
    );
  }
}
