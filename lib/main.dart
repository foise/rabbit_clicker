import 'package:flutter/material.dart';
import 'package:rabbit_clicker/models/game_model.dart';
import 'package:rabbit_clicker/models/upgrade_model.dart';
import 'package:provider/provider.dart';
import 'package:rabbit_clicker/screens/welcome_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RabbitClicker()),
        ChangeNotifierProvider(create: (_) => UpgradeModel()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rabbit Clicker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: WelcomeScreen(),
    );
  }
}
