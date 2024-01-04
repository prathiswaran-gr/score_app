class MatchDetails {
  String matchName;
  String date;
  String time;
  String opponent1;
  String opponent2;

  MatchDetails({
    required this.matchName,
    required this.date,
    required this.time,
    required this.opponent1,
    required this.opponent2,
  });
  Map<String, dynamic> toJson() {
    return {
      'matchName': matchName,
      'date': date,
      'time': time,
      'opponent1': opponent1,
      'opponent2': opponent2,
    };
  }

  // Factory method to create a MatchDetails object from JSON data
  factory MatchDetails.fromJson(Map<String, dynamic> json) {
    return MatchDetails(
      matchName: json['matchName'],
      date: json['date'],
      time: json['time'],
      opponent1: json['opponent1'],
      opponent2: json['opponent2'],
    );
  }

}