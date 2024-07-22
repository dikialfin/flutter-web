import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;

class ResumeCard extends StatefulWidget {
  final String head;

  ResumeCard({super.key, required this.head});

  @override
  State<ResumeCard> createState() => _ResumeCardState();
}

class _ResumeCardState extends State<ResumeCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.head,
            style: GoogleFonts.poppins(
                fontSize: 25, fontWeight: FontWeight.w500, color: Colors.white),
          ),
          SizedBox(
            height: 15,
          ),
          CustomCard(
              head: "Computer Science",
              sub2:
                  "Lorem ipsum dolor sit amet, conscetur adispist elit. Optio quer",
              sub: "Cambridge University / 2016-2019"),
          Container(
            height: 1.5,
            width: MediaQuery.of(context).size.width > 950
                ? MediaQuery.of(context).size.width * 0.35
                : MediaQuery.of(context).size.width * 0.7,
          ),
          CustomCard(
              head: "Computer Science",
              sub2:
                  "Lorem ipsum dolor sit amet, conscetur adispist elit. Optio quer",
              sub: "Cambridge University / 2016-2019"),
          Container(
            height: 1.5,
            width: MediaQuery.of(context).size.width > 950
                ? MediaQuery.of(context).size.width * 0.35
                : MediaQuery.of(context).size.width * 0.7,
          ),
        ],
      ),
    );
  }
}

/* START CUSTOM CARD */
class CustomCard extends StatefulWidget {
  final String head;
  final String sub;
  final String sub2;
  CustomCard(
      {super.key, required this.head, required this.sub, required this.sub2});

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: MediaQuery.of(context).size.width > 950
          ? MediaQuery.of(context).size.width * 0.35
          : MediaQuery.of(context).size.width * 0.7,
      color: Color(0xff161616),
      child: Row(
        children: [
          Container(
            width: 50,
            child: Stack(
              children: [
                Container(
                  height: 250,
                  width: 2,
                  color: Color(0xff009e66),
                ),
                Positioned(
                    top: 50,
                    left: 1,
                    child: Container(
                      height: 20,
                      width: 25,
                      color: Color(0xdd009e66),
                    )),
                Positioned(
                  top: 53,
                  left: 19.5,
                  child: Transform.rotate(
                    angle: 45 * math.pi / 180,
                    child: Container(
                      height: 14,
                      width: 14,
                      color: Color(0xff009e66),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width > 950
                ? MediaQuery.of(context).size.width * 0.35 - 60
                : MediaQuery.of(context).size.width * 0.7 - 65,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 45,
                ),
                Text(
                  widget.head,
                  style: GoogleFonts.poppins(fontSize: 21, color: Colors.white),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  widget.sub,
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.white70,
                      fontWeight: FontWeight.w300),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  widget.sub2,
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.white70,
                      fontWeight: FontWeight.w300),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
/* END CUSTOM CARD */