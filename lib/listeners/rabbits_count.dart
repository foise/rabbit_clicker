import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rabbit_clicker/models/game_model.dart';

class RabbitCountView extends StatefulWidget {
  @override
  _RabbitCountViewState createState() => _RabbitCountViewState();
}

class _RabbitCountViewState extends State<RabbitCountView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<RabbitClicker>(
      builder: (context, gameModel, child) {
        return Text(
          " Rabbits: ${gameModel.rabbitCount.floor()}",
          style: TextStyle(fontSize: 20),
        );
      },
    );
  }
}
