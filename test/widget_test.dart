import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/main.dart';
import 'package:southsea_cinema/views/home_view.dart';
import 'package:southsea_cinema/views/movie_listing.dart';

void main() {
  group('App smoke tests', () {
    testWidgets('App displays HomeView as home', (WidgetTester tester) async {
      await tester.pumpWidget(const SouthseaCinemaApp());
      expect(find.byType(HomeView), findsOneWidget);
      expect(find.text('Southsea Cinema & Arts Centre'), findsOneWidget);
    });

    testWidgets('Displays movie cards and booking buttons',
        (WidgetTester tester) async {
      await tester.pumpWidget(const SouthseaCinemaApp());
      expect(find.text('SPIDER-MAN: INTO THE SPIDER-VERSE'), findsOneWidget);
      expect(find.text('THE PLATFORM'), findsOneWidget);
      expect(find.text('BOOK NOW'), findsNWidgets(2));
    });

    testWidgets(
        'Tapping book now navigates to MovieListing with selected movie',
        (WidgetTester tester) async {
      await tester.pumpWidget(const SouthseaCinemaApp());

      await tester.tap(find.text('BOOK NOW').first);
      await tester.pumpAndSettle();

      expect(find.byType(MovieListing), findsOneWidget);
      expect(
          find.text('SPIDER-MAN: INTO THE SPIDER-VERSE (PG)'), findsOneWidget);
      expect(find.text('Southsea Cinema Room'), findsOneWidget);
      expect(find.text('Sunday 22 Nov 2026 18:00'), findsOneWidget);
      expect(
          find.text(
              'Teen Miles Morales becomes the Spider-Man of his universe and must join with five spider-powered individuals from other dimensions to stop a threat for all realities.'),
          findsOneWidget);
      expect(find.text('(£7.50 each)'), findsOneWidget);
    });

    testWidgets('Add to order button displays correct ticket amount and price',
        (WidgetTester tester) async {
      await tester.pumpWidget(const SouthseaCinemaApp());
      await tester.tap(find.text('BOOK NOW').first);
      await tester.pumpAndSettle();

      await tester.tap(find.byType(DropdownMenu<int>));
      await tester.pumpAndSettle();
      await tester.tap(find.text('2').last);
      await tester.pumpAndSettle();

      await tester.tap(find.text('ADD TO ORDER'));
      await tester.pump();
      expect(find.text('Added 2 tickets to cart! (£15.00)'), findsOneWidget);
    });

    testWidgets(
        'Navigation to different movie from initial MovieListing displays correct movie',
        (WidgetTester tester) async {
      await tester.pumpWidget(const SouthseaCinemaApp());
      await tester.tap(find.text('BOOK NOW').first);
      await tester.pumpAndSettle();
      await tester.tap(find.byType(IconButton).last);
      await tester.pumpAndSettle();
      await tester.tap(find.text('Home'));
      await tester.pumpAndSettle();
      expect(find.byType(HomeView), findsOneWidget);

      await tester.tap(find.text('BOOK NOW').last);
      await tester.pumpAndSettle();

      expect(find.byType(MovieListing), findsOneWidget);
      expect(find.text('THE PLATFORM (18)'), findsOneWidget);
      expect(find.text('Southsea Cinema Room'), findsOneWidget);
      expect(find.text('Tuesday 1 Dec 2026 19:00'), findsOneWidget);
      expect(
          find.text(
              'In a prison where inmates are fed on a descending platform, those on the upper levels take more than their fair share while those below are left to starve on scraps and one man decides to change the system.'),
          findsOneWidget);
      expect(find.text('(£6.00 each)'), findsOneWidget);
    });

    testWidgets('Navigation to different movie shows fresh booking feedback',
        (WidgetTester tester) async {
      await tester.pumpWidget(const SouthseaCinemaApp());
      await tester.tap(find.text('BOOK NOW').first);
      await tester.pumpAndSettle();
      await tester.tap(find.byType(IconButton).last);
      await tester.pumpAndSettle();
      await tester.tap(find.text('Home'));
      await tester.pumpAndSettle();
      expect(find.byType(HomeView), findsOneWidget);

      await tester.tap(find.text('BOOK NOW').last);
      await tester.pumpAndSettle();

      await tester.tap(find.text('ADD TO ORDER'));
      await tester.pump();
      expect(find.text('Added 0 tickets to cart! (£0.00)'), findsOneWidget);
    });
  });
}
