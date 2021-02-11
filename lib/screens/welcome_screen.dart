import 'package:flutter/material.dart';
import 'package:rabbit_clicker/models/upgrade_model.dart';
import 'package:rabbit_clicker/screens/game_screen.dart';
import 'package:provider/provider.dart';
import 'package:rabbit_clicker/models/game_model.dart';

gameScreenPush(context) async {
  Navigator.push(context, MaterialPageRoute(builder: (_) {
    return GameScreen(
      title: "Rabbit Clicker",
    );
  }));
}

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  child: Text("Start"),
                  onPressed: () {
                    Provider.of<RabbitClicker>(context, listen: false)
                        .startTimer();
                    gameScreenPush(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
