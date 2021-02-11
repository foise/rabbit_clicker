import 'package:flutter/material.dart';
import 'package:rabbit_clicker/models/game_model.dart';
import 'package:provider/provider.dart';

class LoseButton extends StatefulWidget {
  @override
  _LoseButtonState createState() => _LoseButtonState();
}

class _LoseButtonState extends State<LoseButton> {
  IconData iconData = Icons.pause;
  @override
  Widget build(BuildContext context) {
    return Consumer<RabbitClicker>(
      builder: (context, gameModel, child) {
        return Card(
          color: Colors.red,
          child: FlatButton(
            child: Container(
              child: Center(
                child: Text(
                  "LOSE",
                  textAlign: TextAlign.center,
                ),
              ),
              height: 30,
              width: 40,
            ),
            onPressed: () {
              gameModel.eatALLHay();
              if (gameModel.pause) {
                gameModel.startTimer();
                gameModel.setPause();
              }
            },
          ),
        );
      },
    );
  }
}
