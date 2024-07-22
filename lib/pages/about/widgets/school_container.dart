import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget School(
        {required String schoolName,
        required String major,
        required String periode,
        bool crosAxisIsStart = false}) =>
    Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      constraints: BoxConstraints(minHeight: 150),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment:
            crosAxisIsStart ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: [
          Text(
            schoolName,
            textDirection:
                crosAxisIsStart ? TextDirection.ltr : TextDirection.rtl,
            style: GoogleFonts.poppins(
                color: Colors.white, fontWeight: FontWeight.w700, fontSize: 20),
          ),
          Text(
            major,
            textDirection:
                crosAxisIsStart ? TextDirection.ltr : TextDirection.rtl,
            style: GoogleFonts.poppins(
                color: Colors.white70,
                fontWeight: FontWeight.w500,
                fontSize: 17),
          ),
          Text(
            periode,
            textDirection:
                crosAxisIsStart ? TextDirection.ltr : TextDirection.rtl,
            style: GoogleFonts.poppins(
                color: Colors.white54,
                fontWeight: FontWeight.w500,
                fontSize: 15),
          ),
        ],
      ),
    );
