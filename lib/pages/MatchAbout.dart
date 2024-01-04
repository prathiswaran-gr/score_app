import 'package:flutter/material.dart';

class MatchAbout extends StatelessWidget {
  final matchDetails;
  const MatchAbout({this.matchDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Match Details"),
      ),
    );
  }
}
