import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class MovieListing extends StatelessWidget {
  final Movie movie;

  const MovieListing({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle, style: cinemaHeaderStyle),
        backgroundColor: cinemaSurface,
        iconTheme: const IconThemeData(color: cinemaBrand),
        elevation: 0,
      ),
      drawer: const NavDrawer(),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            Text("${movie.name.toUpperCase()} (${movie.ageRating})",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: cinemaFontWhite)),
            Image.asset(
              movie.imagePath,
              height: 200,
              fit: BoxFit.cover,
            ),
            Text(
              movie.location,
              style: TextStyle(color: cinemaFontWhite),
            ),
            Text(
              movie.readableDateTime,
              style: TextStyle(color: cinemaFontWhite),
            ),
            Text(
              movie.description,
              style: TextStyle(color: cinemaFontWhite, fontSize: 12),
            ),
            TicketPurchaseMenu(
              movie: movie,
              maxTickets: 5,
            ),
          ],
        ),
      ),
    );
  }
}

class TicketPurchaseMenu extends StatefulWidget {
  final int maxTickets;
  final Movie movie;

  const TicketPurchaseMenu(
      {super.key, required this.movie, required this.maxTickets});

  @override
  State<StatefulWidget> createState() {
    return _TicketPurchaseMenuState();
  }
}

class _TicketPurchaseMenuState extends State<TicketPurchaseMenu> {
  double _totalPrice = 0;
  int _numTickets = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        Text(
          "Tickets",
          style: cinemaHeaderStyle,
        ),
        Row(
          spacing: 10,
          children: [
            DropdownMenu<int>(
              onSelected: (int? value) => setState(() {
                if (value != null) {
                  _numTickets = value;
                  _totalPrice = widget.movie.ticketPrice * _numTickets;
                }
              }),
              dropdownMenuEntries: [
                for (int i = 1; i <= widget.maxTickets; i++)
                  DropdownMenuEntry(value: i, label: "$i")
              ],
            ),
            Text("${widget.movie.formattedPrice} each)")
          ],
        ),
        FilledButton(
          onPressed: () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
                "Added $_numTickets ${_numTickets > 1 ? "tickets" : "ticket"} to cart! (£${_totalPrice.toStringAsFixed(2)})"),
          )),
          style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll<Color>(cinemaBrandLight),
              foregroundColor: WidgetStatePropertyAll<Color>(cinemaFontWhite),
              shape: WidgetStatePropertyAll<OutlinedBorder>(LinearBorder.none)),
          child: Text("ADD TO ORDER"),
        )
      ],
    );
  }
}
