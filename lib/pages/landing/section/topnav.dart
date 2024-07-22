import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_portofolio/cubit/screen_cubit.dart';
import 'package:web_portofolio/pages/landing/widgets/navbutton.dart';
import 'package:web_portofolio/pages/landing/widgets/navbuttoncollapsed.dart';

class Topnav extends StatefulWidget {
  const Topnav({super.key});

  @override
  State<Topnav> createState() => _TopnavState();
}

class _TopnavState extends State<Topnav> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScreenCubit, ScreenState>(
      builder: (context, state) {
        return Container(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "</>",
                style: GoogleFonts.bubblegumSans(
                    fontSize: 31,
                    fontWeight: FontWeight.w900,
                    color: Colors.white),
              ),
              state is ScreenExtraSmall || state is ScreenSmall
                  ? NavButtonCollapsed()
                  : NavButton()
            ],
          ),
        );
      },
    );
  }
}
