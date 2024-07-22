import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:html' as html;

import 'package:typewritertext/typewritertext.dart';
import 'package:web_portofolio/cubit/language_cubit.dart';
import 'package:web_portofolio/cubit/screen_cubit.dart';

class Biografi extends StatefulWidget {
  const Biografi({super.key});

  @override
  State<Biografi> createState() => _BiografiState();
}

class _BiografiState extends State<Biografi> {
  String bio =
      "Hello! I'm a passionate mobile and web developer with a keen eye for detail and a love for crafting elegant solutions to complex problems. With a solid background in both Flutter and Laravel, I thrive on creating seamless and efficient applications that deliver a great user experience. My journey in development began with a curiosity for how things work, and it has blossomed into a fulfilling career where I continuously learn and grow. I believe in the power of collaboration and am always eager to work with like-minded individuals who share a passion for innovation and excellence. Let's connect and build something amazing together!";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScreenCubit, ScreenState>(
      builder: (context, state) {
        return BlocBuilder<LanguageCubit, LanguageState>(
          builder: (context, state) {
            if (state is Indonesian) {
              bio =
                  "Halo! Saya seorang pengembang seluler dan web yang bersemangat dengan perhatian terhadap detail dan senang menciptakan solusi elegan untuk masalah yang kompleks. Dengan latar belakang yang kuat di Flutter dan Laravel, saya berkembang dalam menciptakan aplikasi yang mulus dan efisien yang menghadirkan a pengalaman pengguna yang luar biasa. Perjalanan saya dalam pengembangan dimulai dengan rasa ingin tahu tentang cara kerja, dan ini telah berkembang menjadi karier yang memuaskan di mana saya terus belajar dan berkembang yang memiliki semangat yang sama terhadap inovasi dan keunggulan. Mari terhubung dan membangun sesuatu yang menakjubkan bersama-sama!";
            } else {
              bio =
                  "Hello! I'm a passionate mobile and web developer with a keen eye for detail and a love for crafting elegant solutions to complex problems. With a solid background in both Flutter and Laravel, I thrive on creating seamless and efficient applications that deliver a great user experience. My journey in development began with a curiosity for how things work, and it has blossomed into a fulfilling career where I continuously learn and grow. I believe in the power of collaboration and am always eager to work with like-minded individuals who share a passion for innovation and excellence. Let's connect and build something amazing together!";
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TypeWriter.text(
                  state is Indonesian ? "Siapa saya?" : "Who Am I ?",
                  duration: const Duration(milliseconds: 50),
                  maintainSize: false,
                  style: GoogleFonts.poppins(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 30,
                ),
                TypeWriter.text(
                  maintainSize: false,
                  duration: const Duration(milliseconds: 30),
                  bio,
                  key: Key(bio),
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.white70,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 25,
                ),
                TypeWriter.text(
                  state is Indonesian
                      ? "Bahasa Pemrograman"
                      : "Programming Language",
                  duration: const Duration(milliseconds: 50),
                  maintainSize: false,
                  style: GoogleFonts.poppins(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Container(
                      width: 25,
                      height: 25,
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/icons/dart.png"))),
                    ),
                    Container(
                      width: 25,
                      height: 25,
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/icons/php.png"))),
                    ),
                    Container(
                      width: 25,
                      height: 25,
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage("assets/icons/javascript.png"))),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                TypeWriter.text(
                  state is Indonesian ? "Kerangka Kerja" : "Framework",
                  duration: const Duration(milliseconds: 50),
                  maintainSize: false,
                  style: GoogleFonts.poppins(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Container(
                      width: 25,
                      height: 25,
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage("assets/icons/codeigniter.png"))),
                    ),
                    Container(
                      width: 25,
                      height: 25,
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/icons/laravel.png"))),
                    ),
                    Container(
                      width: 25,
                      height: 25,
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/icons/flutter.png"))),
                    ),
                    Container(
                      width: 25,
                      height: 25,
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/icons/tailwind.png"))),
                    ),
                    Container(
                      width: 25,
                      height: 25,
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/icons/jquery.png"))),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                TypeWriter.text(
                  state is Indonesian ? "Basis Data" : "Database",
                  duration: const Duration(milliseconds: 50),
                  maintainSize: false,
                  style: GoogleFonts.poppins(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Container(
                      width: 25,
                      height: 25,
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/icons/mysql.png"))),
                    ),
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
