class Movie {
  final String id;
  final String name;
  final String description;
  final String ageRating; // https://www.bbfc.co.uk/our-age-ratings
  final String location;
  final String imagePath;
  final DateTime start;
  final DateTime end;

  Movie({
    required this.id,
    required this.name,
    required this.description,
    required this.ageRating,
    required this.location,
    required this.start,
    required this.end,
    required this.imagePath,
  });
}
