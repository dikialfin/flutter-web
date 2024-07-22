import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:typewritertext/typewritertext.dart';
import 'package:web_portofolio/cubit/language_cubit.dart';
import 'package:web_portofolio/cubit/screen_cubit.dart';
import 'dart:html' as html;

class Headlines extends StatefulWidget {
  const Headlines({super.key});

  @override
  State<Headlines> createState() => _HeadlinesState();
}

class _HeadlinesState extends State<Headlines> {
  String headingOne = "Explore Our Diverse Range of Innovative Projects";
  String headingTwo = "Showcase of Excellence";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, LanguageState>(
      builder: (context, state) {
        if (state is Indonesian) {
          headingOne = "Jelajahi Beragam Proyek Inovatif Kami";
          headingTwo = "Pameran Keunggulan";
        } else {
          headingOne = "Explore Our Diverse Range of Innovative Projects";
          headingTwo = "Showcase of Excellence";
        }

        return BlocBuilder<ScreenCubit, ScreenState>(
          builder: (context, state) {
            return Container(
              height: state is ScreenExtraSmall || state is ScreenSmall
                  ? MediaQuery.of(context).size.height * 0.7
                  : MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TypeWriter.text(headingOne,
                      style: GoogleFonts.poppins(
                          fontSize:
                              state is ScreenExtraSmall || state is ScreenSmall
                                  ? 21
                                  : state is ScreenExtraLarge
                                      ? 41
                                      : 31,
                          fontWeight: FontWeight.w500,
                          color: Colors.white54),
                      maintainSize: false,
                      duration: Duration(milliseconds: 50)),
                  TypeWriter.text(headingTwo,
                      style: GoogleFonts.poppins(
                          fontSize:
                              state is ScreenExtraSmall || state is ScreenSmall
                                  ? 61
                                  : state is ScreenExtraLarge
                                      ? 81
                                      : 71,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                      maintainSize: false,
                      duration: Duration(milliseconds: 50)),
                  Spacer(),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          html.window
                              .open("https://github.com/dikialfin", "_blank");
                        },
                        icon: Icon(FontAwesomeIcons.github),
                        color: Colors.white,
                      ),
                      IconButton(
                        onPressed: () {
                          html.window.open(
                              "https://www.instagram.com/diki.alfin_",
                              "_blank");
                        },
                        icon: Icon(FontAwesomeIcons.instagram),
                        color: Colors.white,
                      ),
                      IconButton(
                        onPressed: () {
                          html.window.open(
                              "https://www.linkedin.com/in/mohamaddikialfin/",
                              "_blank");
                        },
                        icon: Icon(FontAwesomeIcons.linkedin),
                        color: Colors.white,
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }
}
