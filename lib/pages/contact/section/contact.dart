import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:html' as html;

class ContactCard extends StatefulWidget {
  const ContactCard({super.key});

  @override
  State<ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<ContactCard> {
  double transformTranslateX = -300;
  double transformTranslatey = -100;
  double transformTranslateY = 100;

  Widget buttonContact(
          {required IconData icon,
          required String title,
          required String subtitle,
          required String url}) =>
      TextButton(
          style: ButtonStyle(overlayColor: WidgetStateColor.transparent),
          onPressed: () {
            html.window.open(url, "_blank");
          },
          child: Container(
            height: 75,
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 35,
                  color: Color(0xff009e66),
                ),
                SizedBox(
                  width: 35,
                ),
                Container(
                  width: 3,
                  color: Colors.white30,
                ),
                SizedBox(
                  width: 35,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.poppins(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        subtitle,
                        style: GoogleFonts.poppins(
                            fontSize: 13,
                            color: Colors.white70,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                )
              ],
            ),
          ));

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        transformTranslateX = 0;
        transformTranslatey = 0;
        transformTranslateY = 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      clipBehavior: Clip.hardEdge,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white)),
      child: Column(
        children: [
          AnimatedContainer(
            duration: Duration(seconds: 1),
            transform: Matrix4.translationValues(0, transformTranslatey, 0),
            child: buttonContact(
                icon: FontAwesomeIcons.linkedin,
                title: "Linkedin",
                subtitle: "Muhammad Diki Alfin",
                url: "https://www.linkedin.com/in/mohamaddikialfin/"),
          ),
          AnimatedContainer(
            duration: Duration(seconds: 1),
            transform: Matrix4.translationValues(transformTranslateX, 0, 0),
            child: buttonContact(
                icon: FontAwesomeIcons.instagram,
                title: "Instagram",
                subtitle: "@diki.alfin_",
                url: "https://www.instagram.com/diki.alfin_"),
          ),
          AnimatedContainer(
            duration: Duration(seconds: 1),
            transform: Matrix4.translationValues(0, transformTranslateY, 0),
            child: buttonContact(
                icon: Icons.email_outlined,
                title: "Email",
                subtitle: "muhammaddikialfin@outlook.com",
                url: "mailto:muhammaddikialfin@outlook.com"),
          ),
        ],
      ),
    );
  }
}
