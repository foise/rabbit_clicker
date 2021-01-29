import 'package:flutter/material.dart';
import 'package:rabbit_clicker/models/game_model.dart';
import 'package:provider/provider.dart';

class PopUpText extends StatefulWidget {
  @override
  _PopUpTextState createState() => _PopUpTextState();
}

class _PopUpTextState extends State<PopUpText> {
  @override
  Widget build(BuildContext context) {
    return Consumer<RabbitClicker>(
      builder: (context, gameModel, child) {
        if (gameModel.tap) {
          return Positioned(
            top: gameModel.tapdy - 110.0,
            left: gameModel.tapdx,
            child: Text(
              "+1",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
