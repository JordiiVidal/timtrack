import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarCustom extends StatelessWidget {
  final String title;

  const AppBarCustom({Key key, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 12.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  this.title,
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            child: Container(
              child: Text('November 2020'),
            ),
          ),
        ],
      ),
    );
  }
}
