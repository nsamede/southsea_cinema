class Movie {
  final String id;
  final String name;
  final String description;
  final String ageRating; // https://www.bbfc.co.uk/our-age-ratings
  final String location;
  final String imagePath;
  final DateTime start;
  final DateTime end;
  final double ticketPrice;

  Movie({
    required this.id,
    required this.name,
    required this.description,
    required this.ageRating,
    required this.location,
    required this.start,
    required this.end,
    required this.imagePath,
    required this.ticketPrice,
  });

  String getReadableDateTime() {
    Map<int, String> weekdays = {
      1: 'Monday',
      2: 'Tuesday',
      3: 'Wednesday',
      4: 'Thursday',
      5: 'Friday',
      6: 'Saturday',
      7: 'Sunday',
    };

    Map<int, String> months = {
      1: 'January',
      2: 'February',
      3: 'March',
      4: 'April',
      5: 'May',
      6: 'June',
      7: 'July',
      8: 'August',
      9: 'September',
      10: 'October',
      11: 'November',
      12: 'December',
    };

    return '${weekdays[start.weekday]} ${start.day} ${months[start.month]!.substring(0, 3)} '
      '${start.year} ${start.hour}:${start.minute == 0 ? '00' : start.minute}';
  }
}
