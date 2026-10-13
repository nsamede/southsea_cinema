import 'package:flutter/material.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/views/movie_listing.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsetsGeometry.all(16),
      elevation: 0,
      color: cinemaBackground,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                movie.name.toUpperCase(),
                style: TextStyle(
                    color: cinemaBrandDark,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 5),
              Text(
                '(${movie.ageRating})',
                style: TextStyle(color: cinemaFontMuted, fontSize: 10),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                movie.imagePath,
                width: 100,
                fit: BoxFit.cover,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Text(
                movie.description,
                style: TextStyle(color: cinemaFontWhite, fontSize: 12),
              ))
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                movie.getReadableDateTime(),
                style: TextStyle(color: cinemaFontWhite, fontSize: 12),
              ),
              FilledButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return MovieListing(
                      movie: movie,
                    );
                  }));
                },
                style: ButtonStyle(
                    backgroundColor:
                        WidgetStatePropertyAll<Color>(cinemaBrandLight),
                    foregroundColor:
                        WidgetStatePropertyAll<Color>(cinemaFontWhite),
                    shape: WidgetStatePropertyAll<OutlinedBorder>(
                        LinearBorder.none)),
                child: Text(
                  "BOOK NOW",
                  style: TextStyle(
                      color: cinemaFontWhite,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
