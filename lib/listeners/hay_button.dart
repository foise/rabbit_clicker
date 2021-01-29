import 'package:flutter/material.dart';
import 'package:rabbit_clicker/models/game_model.dart';
import 'package:provider/provider.dart';

class HayButton extends StatefulWidget {
  @override
  _HayButtonState createState() => _HayButtonState();
}

class _HayButtonState extends State<HayButton> {
  @override
  Widget build(BuildContext context) {
    return Consumer<RabbitClicker>(
      builder: (context, gameModel, child) {
        return GestureDetector(
          onTapDown: (TapDownDetails details) {
            gameModel.addHay(1);
            gameModel.press();
            gameModel.updateTapDetails(details);
          },
          onTapUp: (TapUpDetails details) => gameModel.unpress(),
          onTapCancel: () => gameModel.unpress(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 30,
                height: 30,
                child: Icon(Icons.add),
              ),
            ],
          ),
        );
      },
    );
  }
}
