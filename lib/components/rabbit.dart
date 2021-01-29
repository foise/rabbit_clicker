import 'package:flutter/material.dart';

class Rabbit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      foregroundDecoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/r.png'),
        ),
      ),
    );
  }
}
