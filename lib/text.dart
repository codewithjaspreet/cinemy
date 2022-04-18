import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Textchange extends StatelessWidget {
  double fontSize;
  Color color;
  final String text;

  Textchange(
      {Key? key,
      required this.text,
      this.color = Colors.white,
      required this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.breeSerif(
        color: color,
        fontSize: fontSize,
      ),
    );
  }
}
