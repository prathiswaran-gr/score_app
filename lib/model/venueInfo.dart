class VenueGuide {
  String stadium;
  String city;
  String ends;
  String hosts;

  VenueGuide({
    required this.stadium,
    required this.city,
    required this.ends,
    required this.hosts,
  });

  // Method to convert VenueGuide object to JSON format
  Map<String, dynamic> toJson() {
    return {
      'stadium': stadium,
      'city': city,
      'ends': ends,
      'hosts': hosts,
    };
  }
}

