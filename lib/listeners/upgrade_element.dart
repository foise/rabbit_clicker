import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rabbit_clicker/models/upgrade_model.dart';

Widget updateElement(int position) {
  return Consumer<UpgradeModel>(
    builder: (context, updateModel, child) {
      return Card(
        child: ListTile(
          tileColor:
              updateModel.list[position].active ? Colors.green : Colors.red,
          leading: FlutterLogo(),
          title: Text(updateModel.list[position].name),
          onTap: () {
            updateModel.buyUpgrade(position);
          },
        ),
      );
    },
  );
}
