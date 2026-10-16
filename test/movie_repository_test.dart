import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/repositories/movie_repository.dart';

void main() {
  group('MovieRepository tests', () {
    final MovieRepository repository = MovieRepository();
    final List<Movie> movies = repository.getMovies();

    test('getMovies returns valid movies', () {
      final Movie spiderMan = movies[0];
      expect(spiderMan.id, 'spider-man-into-the-spiderverse');
      expect(spiderMan.name, 'Spider-Man: Into the Spider-Verse');
      expect(spiderMan.description,
          'Teen Miles Morales becomes the Spider-Man of his universe and must join with five spider-powered individuals from other dimensions to stop a threat for all realities.');
      expect(spiderMan.ageRating, 'PG');
      expect(spiderMan.location, 'Southsea Cinema Room');
      expect(spiderMan.start, DateTime(2026, 11, 22, 18));
      expect(spiderMan.end, DateTime(2026, 11, 22, 20));
      expect(spiderMan.imagePath,
          'assets/images/spiderman-into-the-spider-verse.jpg');
      expect(spiderMan.ticketPrice, 7.50);

      final Movie thePlatform = movies[1];
      expect(thePlatform.id, 'the-platform');
      expect(thePlatform.name, 'The Platform');
      expect(thePlatform.description,
          'In a prison where inmates are fed on a descending platform, those on the upper levels take more than their fair share while those below are left to starve on scraps and one man decides to change the system.');
      expect(thePlatform.ageRating, '18');
      expect(thePlatform.location, 'Southsea Cinema Room');
      expect(thePlatform.start, DateTime(2026, 12, 1, 19));
      expect(thePlatform.end, DateTime(2026, 12, 1, 20, 40));
      expect(thePlatform.imagePath, 'assets/images/the-platform.jpg');
      expect(thePlatform.ticketPrice, 6.00);
    });

    test('getMovieById returns matching movie when id exists', () {
      final Movie? movie = repository.getMovieById('the-platform');
      expect(movie, isNotNull);
    });

    test('getMovieById returns null when id does not exist', () {
      final Movie? movie = repository.getMovieById('non-existent');
      expect(movie, isNull);
    });
  });
}
