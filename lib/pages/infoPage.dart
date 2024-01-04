import 'package:cricket_scoreboard/model/venueInfo.dart';
import 'package:flutter/material.dart';

import '../model/matchInfo.dart';

class MatchDetailsPage extends StatelessWidget {
  final MatchInfo matchInfo;
  final VenueGuide venueInfo;

  MatchDetailsPage({
    required this.matchInfo,
    required this.venueInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Info'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: Colors.blue,
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Match Info',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text('Match: ${matchInfo.match}', style: TextStyle(color: Colors.black)),
                    Text('Series: ${matchInfo.series}', style: TextStyle(color: Colors.black)),
                    Text('Date: ${matchInfo.date}', style: TextStyle(color: Colors.black)),
                    Text('Time: ${matchInfo.time}', style: TextStyle(color: Colors.black)),
                    Text('Venue: ${matchInfo.venue}', style: TextStyle(color: Colors.black)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Card(
              color: Colors.green,
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Venue Guide',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text('Stadium: ${venueInfo.stadium}', style: TextStyle(color: Colors.black)),
                    Text('City: ${venueInfo.city}', style: TextStyle(color: Colors.black)),
                    Text('Ends: ${venueInfo.ends}', style: TextStyle(color: Colors.black)),
                    Text('Hosts: ${venueInfo.hosts}', style: TextStyle(color: Colors.black)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
