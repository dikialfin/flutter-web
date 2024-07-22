import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:typewritertext/typewritertext.dart';
import 'package:web_portofolio/cubit/language_cubit.dart';
import 'package:web_portofolio/cubit/screen_cubit.dart';
import 'package:web_portofolio/pages/contact/Contact.dart';

class Containt extends StatefulWidget {
  const Containt({super.key});

  @override
  State<Containt> createState() => _ContaintState();
}

class _ContaintState extends State<Containt> {
  double opacity = 0;
  late ScreenState screenState;

  Route _createRoute({required StatefulWidget page}) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      Duration(seconds: 2),
      () {
        setState(() {
          opacity = 1.0;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, LanguageState>(
      builder: (context, state) {
        String introSelf = "a Mobile & Web software developer";

        if (state is Indonesian) {
          introSelf = "seorang Pengembang Perangkat Lunak Mobile & Web";
        }

        return Container(
          width: double.infinity,
          child: Column(
            children: [
              BlocBuilder<ScreenCubit, ScreenState>(
                builder: (context, state) {
                  return TypeWriter.text("Mohamad Diki Alfin",
                      maintainSize: false,
                      duration: Duration(milliseconds: 100),
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontSize:
                              state is ScreenExtraSmall || state is ScreenSmall
                                  ? 40
                                  : 71,
                          fontWeight: FontWeight.w700,
                          color: Colors.white));
                },
              ),
              BlocBuilder<ScreenCubit, ScreenState>(
                builder: (context, state) {
                  return TypeWriter.text(introSelf,
                      key: Key(introSelf),
                      maintainSize: false,
                      duration: Duration(milliseconds: 50),
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontSize:
                              state is ScreenExtraSmall || state is ScreenSmall
                                  ? 20
                                  : 31,
                          fontWeight: FontWeight.w500,
                          color: Colors.white54));
                },
              ),
              SizedBox(
                height: 30,
              ),
              AnimatedOpacity(
                curve: Curves.ease,
                opacity: opacity,
                duration: Duration(seconds: 3),
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(_createRoute(page: const Contact()));
                  },
                  child: Text(
                    state is Indonesian ? "Hubungi saya" : "Contact Me",
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 15),
                  ),
                  style: ButtonStyle(
                      padding: WidgetStatePropertyAll(
                          EdgeInsets.symmetric(vertical: 10, horizontal: 50)),
                      backgroundColor: WidgetStatePropertyAll(Colors.green)),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
