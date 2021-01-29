import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rabbit_clicker/models/game_model.dart';

class HayCountView extends StatefulWidget {
  @override
  _HayCountViewState createState() => _HayCountViewState();
}

class _HayCountViewState extends State<HayCountView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<RabbitClicker>(
      builder: (context, gameModel, child) {
        return Container(
          child: Tooltip(
            waitDuration: Duration(milliseconds: 0),
            textStyle: TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.9),
              borderRadius: const BorderRadius.all(Radius.circular(4)),
            ),
            message:
                "Current consumption: ${gameModel.hayConsumptionPerSecond.floor()} per second",
            child: Text(
              " Hay: ${gameModel.hayCount.floor()}",
              style: TextStyle(fontSize: 20),
            ),
          ),
        );
      },
    );
  }
}
