class MatchInfo {
  String match;
  String series;
  String date;
  String time;
  String venue;

  MatchInfo({
    required this.match,
    required this.series,
    required this.date,
    required this.time,
    required this.venue,
  });

  // Method to convert MatchInfo object to JSON format
  Map<String, dynamic> toJson() {
    return {
      'match': match,
      'series': series,
      'date': date,
      'time': time,
      'venue': venue,
    };
  }
}

