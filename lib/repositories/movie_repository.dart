import 'package:southsea_cinema/models/movie.dart';

class MovieRepository {
  List<Movie> getMovies() {
    return [
      Movie(
          id: 'spider-man-into-the-spiderverse',
          name: 'Spider-Man: Into the Spider-Verse',
          description:
              'Teen Miles Morales becomes the Spider-Man of his universe and must join with five spider-powered individuals from other dimensions to stop a threat for all realities.',
          ageRating: 'PG',
          location: 'Southsea Cinema Room',
          start: DateTime(2026, 8, 22, 18),
          end: DateTime(2026, 8, 22, 20),
          imagePath: 'assets/images/spiderman-into-the-spider-verse'),
      Movie(
          id: 'the-platform',
          name: 'The Platform',
          description:
              'In a prison where inmates are fed on a descending platform, those on the upper levels take more than their fair share while those below are left to starve on scraps and one man decides to change the system.',
          ageRating: '18',
          location: 'Southsea Cinema Room',
          start: DateTime(2026, 9, 10, 19),
          end: DateTime(2026, 9, 10, 20, 40),
          imagePath: 'assets/images/the-platform'),
    ];
  }
}
