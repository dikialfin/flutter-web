import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:typewritertext/typewritertext.dart';
import 'package:web_portofolio/cubit/language_cubit.dart';

class Head extends StatefulWidget {
  const Head({super.key});

  @override
  State<Head> createState() => _HeadState();
}

class _HeadState extends State<Head> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, LanguageState>(
      builder: (context, state) {
        String title = "Feel free to contact me anytimes";
        String subtitle = "Contact Info";
        if (state is Indonesian) {
          title = "Jangan ragu untuk menghubungi saya kapan saja";
          subtitle = "Info Kontak";
        }

        return Column(
          children: [
            TypeWriter.text(
              duration: Duration(milliseconds: 70),
              maintainSize: false,
              title,
              key: Key(title),
              style: GoogleFonts.poppins(
                  fontSize: 15,
                  color: Colors.white70,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 8,
            ),
            TypeWriter.text(
              duration: Duration(milliseconds: 70),
              maintainSize: false,
              subtitle,
              key: Key(subtitle),
              style: GoogleFonts.poppins(
                  fontSize: 46,
                  color: Colors.white,
                  fontWeight: FontWeight.w700),
            ),
          ],
        );
      },
    );
  }
}
