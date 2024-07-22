import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ServiceCard extends StatefulWidget {
  final IconData icon;
  final String head;
  final String sub;

  const ServiceCard(
      {super.key, required this.head, required this.sub, required this.icon});

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          hover = true;
          print("Hover : $hover");
        });
      },
      onExit: (event) {
        setState(() {
          hover = false;
          print("Hover : $hover");
        });
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.black45,
                  offset: Offset(-1, 1),
                  blurRadius: 5,
                  spreadRadius: 0.5)
            ], color: Color(0xffacacac).withOpacity(0.4)),
            margin: EdgeInsets.only(bottom: 50),
            height: 230,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 35, bottom: 30, top: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        widget.icon,
                        color: Colors.white,
                        size: 50,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        widget.head,
                        style: GoogleFonts.poppins(
                            fontSize: 21,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        widget.sub,
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Colors.white70,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                AnimatedContainer(
                  duration: Duration(milliseconds: 250),
                  curve: Curves.easeInOut,
                  height: 2,
                  color: !hover
                      ? Color(0xffacacac).withOpacity(0.4)
                      : Color(0xff009e66),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
