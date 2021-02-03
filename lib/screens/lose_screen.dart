import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rabbit_clicker/models/game_model.dart';
import 'package:rabbit_clicker/screens/welcome_screen.dart';

class LoseScreen extends StatefulWidget {
  @override
  _LoseScreenState createState() => _LoseScreenState();
}

class _LoseScreenState extends State<LoseScreen> {
  Future<bool> _onWillPop() async {
    Widget cancelButton = FlatButton(
      child: Text("No"),
      onPressed: () {
        return Navigator.pop(context);
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Yes"),
      onPressed: () {
        Provider.of<RabbitClicker>(context, listen: false).handleLose();
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return WelcomeScreen();
        }));
      },
    );
    AlertDialog alert = AlertDialog(
      title: Text("Exit?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Rabbit Clicker"),
        ),
        body: Stack(
          children: [
            Center(
              child: Consumer<RabbitClicker>(
                builder: (context, gameModel, child) {
                  return Column(
                    children: [
                      Text(
                        "Highscore: ${gameModel.highScore.floor()}",
                        style: TextStyle(fontSize: 20),
                      ),
                      FlatButton(
                        child: Container(
                          child: Text("Return"),
                          width: 100,
                          height: 50,
                          color: Colors.teal,
                        ),
                        onPressed: () {
                          gameModel.handleLose();
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) {
                            return WelcomeScreen();
                          }));
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
