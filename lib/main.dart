import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_portofolio/cubit/language_cubit.dart';
import 'package:web_portofolio/cubit/screen_cubit.dart';
import 'package:web_portofolio/pages/about/About.dart';
import 'package:web_portofolio/pages/contact/Contact.dart';
import 'package:web_portofolio/pages/landing/Landing.dart';
import 'package:web_portofolio/pages/showcase/Showcase.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LanguageCubit(),
        ),
        BlocProvider(
          create: (context) => ScreenCubit(),
        ),
      ],
      child: MaterialApp(
        title: "Mohamad Diki Alfin",
        initialRoute: "/",
        routes: {
          "/": (context) => Landing(),
          "/about": (context) => About(),
          "/contact": (context) => Contact(),
          "/showcase": (context) => Showcase(),
        },
      ),
    );
  }
}
// https://kuon-yagi-portfolio.netlify.app/#contact