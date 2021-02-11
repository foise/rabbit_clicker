import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rabbit_clicker/listeners/lose_button.dart';
import 'package:rabbit_clicker/listeners/pause_button.dart';
import 'package:rabbit_clicker/listeners/upgrade_list.dart';
import 'package:rabbit_clicker/listeners/watch_view.dart';
import 'package:rabbit_clicker/models/game_model.dart';
import 'package:rabbit_clicker/listeners/hay_count.dart';
import 'package:rabbit_clicker/listeners/hay_button.dart';
import 'package:rabbit_clicker/listeners/popup_text.dart';
import 'package:rabbit_clicker/listeners/rabbits_count.dart';
import 'package:rabbit_clicker/screens/lose_screen.dart';
import 'package:rabbit_clicker/screens/welcome_screen.dart';

class GameScreen extends StatefulWidget {
  GameScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
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
        Provider.of<RabbitClicker>(context, listen: false).stopTimer();
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
    if (!Provider.of<RabbitClicker>(context).lose) {
      return WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          drawer: UpgradeList(),
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Stack(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        RabbitCountView(),
                        Expanded(
                          child: HayCountView(),
                        ),
                        Row(
                          children: [
                            WatchView(),
                            PauseButton(),
                            LoseButton(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              PopUpText(),
              Center(
                child: HayButton(),
              ),
            ],
          ),
        ),
      );
    } else {
      return LoseScreen();
    }
  }
}
