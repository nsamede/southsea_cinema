import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class MovieListing extends StatelessWidget {
  const MovieListing({super.key});

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("DRACULA (1931) (PG)", style: listingHeaderStyle),
            Text(
              "The dashing, mysterious Count Dracula (Bela Lugosi) travels to London"
              " and takes up residence in an old castle. Soon he begins to wreak havoc, "
              "sucking the blood of young women and turning them into vampires. "
              "Van Helsing is enlisted to put a stop to the count's never-ending bloodlust.",
              style: TextStyle(color: cinemaFontWhite),
            ),
          ],
        ),
      ),
    );
  }
}
