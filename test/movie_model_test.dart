import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';

void main() {
  group('Movie model tests', () {
    test('Creates Movie instance with correct properties', () {
      Movie movie = Movie(
        id: 'the-platform',
        name: 'The Platform',
        description:
            'In a prison where inmates are fed on a descending platform, those on the upper levels take more than their fair share while those below are left to starve on scraps and one man decides to change the system.',
        ageRating: '18',
        location: 'Southsea Cinema Room',
        start: DateTime(2026, 12, 1, 19),
        end: DateTime(2026, 12, 1, 20, 40),
        imagePath: 'assets/images/the-platform.jpg',
        ticketPrice: 6.00,
      );

      expect(movie.id, 'the-platform');
      expect(movie.name, 'The Platform');
      expect(movie.description,
          'In a prison where inmates are fed on a descending platform, those on the upper levels take more than their fair share while those below are left to starve on scraps and one man decides to change the system.');
      expect(movie.ageRating, '18');
      expect(movie.location, 'Southsea Cinema Room');
      expect(movie.start, DateTime(2026, 12, 1, 19));
      expect(movie.end, DateTime(2026, 12, 1, 20, 40));
      expect(movie.imagePath, 'assets/images/the-platform.jpg');
      expect(movie.ticketPrice, 6.00);
    });

    test(
        'formattedPrice returns correct price prefixed with pound sign and two decimals',
        () {
      Movie movieWholePound = Movie(
        id: 'the-platform',
        name: 'The Platform',
        description:
            'In a prison where inmates are fed on a descending platform, those on the upper levels take more than their fair share while those below are left to starve on scraps and one man decides to change the system.',
        ageRating: '18',
        location: 'Southsea Cinema Room',
        start: DateTime(2026, 12, 1, 19),
        end: DateTime(2026, 12, 1, 20, 40),
        imagePath: 'assets/images/the-platform.jpg',
        ticketPrice: 6,
      );
      Movie movieDecimalPound = Movie(
        id: 'the-platform',
        name: 'The Platform',
        description:
            'In a prison where inmates are fed on a descending platform, those on the upper levels take more than their fair share while those below are left to starve on scraps and one man decides to change the system.',
        ageRating: '18',
        location: 'Southsea Cinema Room',
        start: DateTime(2026, 12, 1, 19),
        end: DateTime(2026, 12, 1, 20, 40),
        imagePath: 'assets/images/the-platform.jpg',
        ticketPrice: 6.25,
      );
      expect(movieWholePound.formattedPrice, '£6.00');
      expect(movieDecimalPound.formattedPrice, '£6.25');
    });
  });
}
