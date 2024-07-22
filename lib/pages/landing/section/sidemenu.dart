import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:html' as html;

import 'package:web_portofolio/cubit/language_cubit.dart';
import 'package:web_portofolio/cubit/screen_cubit.dart';

class Sidemenu extends StatefulWidget {
  const Sidemenu({super.key});

  @override
  State<Sidemenu> createState() => _SidemenuState();
}

class _SidemenuState extends State<Sidemenu> {
  double? iconSize = null;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BlocBuilder<LanguageCubit, LanguageState>(
            builder: (context, state) {
              return RotatedBox(
                quarterTurns: 1,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.read<LanguageCubit>().changeTo(Indonesian());
                      },
                      child: Text(
                        "ID",
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: state is Indonesian
                                ? Colors.green
                                : Colors.white),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        context.read<LanguageCubit>().changeTo(English());
                      },
                      child: Text(
                        "ENG",
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color:
                                state is English ? Colors.green : Colors.white),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
          BlocBuilder<ScreenCubit, ScreenState>(
            builder: (context, state) {
              if (state is ScreenExtraSmall) {
                iconSize = state.width * 0.03;
              }

              if (state is ScreenSmall) {
                iconSize = null;
              }

              return Column(
                children: [
                  IconButton(
                      onPressed: () {
                        html.window.open(
                            "https://www.instagram.com/diki.alfin_", "_blank");
                      },
                      icon: Icon(
                        FontAwesomeIcons.instagram,
                        color: Colors.white,
                        size: iconSize,
                      )),
                  IconButton(
                      onPressed: () {
                        html.window.open(
                            "https://www.linkedin.com/in/mohamaddikialfin/",
                            "_blank");
                      },
                      icon: Icon(
                        FontAwesomeIcons.linkedin,
                        color: Colors.white,
                        size: iconSize,
                      )),
                  IconButton(
                      onPressed: () {
                        html.window
                            .open("https://github.com/dikialfin", "_blank");
                      },
                      icon: Icon(
                        FontAwesomeIcons.github,
                        color: Colors.white,
                        size: iconSize,
                      )),
                  IconButton(
                      onPressed: () {
                        html.window.open(
                            "mailto:muhammaddikialfin@outlook.com", "_blank");
                      },
                      icon: Icon(
                        Icons.email,
                        color: Colors.white,
                        size: iconSize,
                      )),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
