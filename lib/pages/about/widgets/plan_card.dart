import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlanCard extends StatefulWidget {
  final IconData icon;
  final String btext;

  PlanCard({super.key, required this.btext, required this.icon});

  @override
  State<PlanCard> createState() => _PlanCardState();
}

class _PlanCardState extends State<PlanCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 50),
      height: 550,
      color: Color(0xffacacac).withOpacity(0.4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            widget.icon,
            color: Color(0xff009e66),
            size: 75,
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            "Mobile App Design",
            style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w300,
                color: Colors.white70),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "24/7 Support",
            style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w300,
                color: Colors.white70),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 40,
            width: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Color(0xff009e66)),
            child: Center(
              child: Text(
                widget.btext,
                style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w300),
              ),
            ),
          )
        ],
      ),
    );
  }
}
