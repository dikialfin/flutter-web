import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_portofolio/cubit/language_cubit.dart';
import 'package:web_portofolio/pages/showcase/Showcase.dart';
import 'package:web_portofolio/pages/about/About.dart';
import 'package:web_portofolio/pages/contact/Contact.dart';
import 'package:web_portofolio/route_builder.dart';

class NavButton extends StatefulWidget {
  const NavButton({super.key});

  @override
  State<NavButton> createState() => _NavButtonState();
}

class _NavButtonState extends State<NavButton> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, LanguageState>(
      builder: (context, state) {
        return Row(
          children: [
            TextButton(
                onPressed: () {
                  Navigator.push(context, createRoute(page: About()));
                },
                child: Text(
                  state is Indonesian ? "Tentang" : "About",
                  style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                      color: Colors.white),
                )),
            TextButton(
                onPressed: () {
                  Navigator.push(context, createRoute(page: Contact()));
                },
                child: Text(
                  state is Indonesian ? "Kontak" : "Contact",
                  style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                      color: Colors.white),
                )),
            TextButton(
                onPressed: () {
                  Navigator.push(context, createRoute(page: Showcase()));
                },
                child: Text(
                  state is Indonesian ? "Proyek" : "Showcase",
                  style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                      color: Colors.white),
                )),
          ],
        );
      },
    );
  }
}
