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
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 30,
          children: [
            Text("DRACULA (1931) (PG)", style: listingHeaderStyle),
            Text(
              "The dashing, mysterious Count Dracula (Bela Lugosi) travels to London"
              " and takes up residence in an old castle. Soon he begins to wreak havoc, "
              "sucking the blood of young women and turning them into vampires. "
              "Van Helsing is enlisted to put a stop to the count's never-ending bloodlust.",
              style: TextStyle(color: cinemaFontWhite),
            ),
            Column(
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
                      initialSelection: 0,
                      dropdownMenuEntries: [
                        for (int i = 0; i <= 5; i++)
                          DropdownMenuEntry(value: i, label: "$i")
                      ],
                    ),
                    Text("Adult (£7.50)")
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
