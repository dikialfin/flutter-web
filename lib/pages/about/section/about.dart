import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_portofolio/cubit/language_cubit.dart';
import 'package:web_portofolio/cubit/screen_cubit.dart';
import 'package:web_portofolio/pages/about/widgets/avatar.dart';
import 'package:web_portofolio/pages/about/widgets/biografi.dart';

class AboutMe extends StatefulWidget {
  const AboutMe({super.key});

  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  late ScreenState screenState;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScreenCubit, ScreenState>(
      builder: (context, state) {
        screenState = state;

        return BlocBuilder<LanguageCubit, LanguageState>(
          builder: (context, state) {
            return Column(
              children: [
                Text(
                  state is Indonesian ? "Kenali saya" : "Get to know me",
                  style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: Colors.white70,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  state is Indonesian ? "Tentang saya" : "About me",
                  style: GoogleFonts.poppins(
                      fontSize: 46,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 30,
                ),
                screenState is ScreenExtraSmall || screenState is ScreenSmall
                    ? Column(
                        children: [
                          Avatar(),
                          SizedBox(
                            height: 30,
                          ),
                          Biografi()
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                              flex: 1,
                              child: Center(
                                child: Avatar(),
                              )),
                          Flexible(flex: 1, child: Biografi())
                        ],
                      )
              ],
            );
          },
        );
      },
    );
  }
}
