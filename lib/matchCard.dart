import 'package:cricket_scoreboard/model/MatchDetails.dart';
import 'package:flutter/material.dart';

class MatchCard extends StatelessWidget {
  final MatchDetails matchDetails;

  MatchCard({required this.matchDetails});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              matchDetails.matchName,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text('Date: ${matchDetails.date}'),
            Text('Time: ${matchDetails.time}'),
            Text('Opponent 1: ${matchDetails.opponent1}'),
            Text('Opponent 2: ${matchDetails.opponent2}'),
          ],
        ),
      ),
    );
  }
}