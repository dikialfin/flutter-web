import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CvCard extends StatefulWidget {
  final String text;
  final String text2;
  const CvCard({super.key, required this.text, required this.text2});

  @override
  State<CvCard> createState() => _CvCardState();
}

class _CvCardState extends State<CvCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text(
            widget.text,
            maxLines: 1,
            style: GoogleFonts.poppins(
                fontSize: 16, color: Colors.white, fontWeight: FontWeight.w400),
          ),
          Text(
            widget.text2,
            maxLines: 1,
            style: GoogleFonts.poppins(
                fontSize: 16, color: Colors.white, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
