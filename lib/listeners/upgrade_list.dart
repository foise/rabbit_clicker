import 'dart:async';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:rabbit_clicker/listeners/upgrade_element.dart';
import 'package:rabbit_clicker/models/game_model.dart';
import 'package:rabbit_clicker/models/upgrade_model.dart';

class UpgradeList extends StatefulWidget {
  @override
  _UpgradeListState createState() => _UpgradeListState();
}

class _UpgradeListState extends State<UpgradeList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UpgradeModel>(
      builder: (context, upgradeModel, child) {
        return Drawer(
          child: SafeArea(
            child: ListView.builder(
              padding: EdgeInsets.only(bottom: 20.0, left: 10.0, right: 10.0),
              itemCount: upgradeModel.list.length,
              itemBuilder: (context, position) {
                Upgrade upgrade = upgradeModel.list[position];
                return updateElement(position);
              },
            ),
          ),
        );
      },
    );
  }
}
