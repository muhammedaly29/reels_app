import 'package:flutter/material.dart';

class TitLe extends StatelessWidget {
  const TitLe({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20.0),
      child: Row(
        children: [
          Icon(
            Icons.play_arrow,
            size: 20,
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Reels',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
