import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_portofolio/cubit/screen_cubit.dart';
import 'package:web_portofolio/pages/showcase/widgets/project_card.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';

class Projects extends StatefulWidget {
  const Projects({super.key});

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  ScrollController scrollController = ScrollController();

  final List<Widget> listProject = [
    ProjectCard(
      projectName: "Flutter Web Portfolio",
      techStack: [
        AssetImage("assets/icons/flutter.png"),
      ],
      developOn: DateTime.now(),
      projectDesc:
          "Aplikasi android yang kami buat berdasarkan keresahan kami dalam melacak aktivitas ibadah dalam bulan Ramadan. Awalnya kami menggunakan google form untuk melakukan tracking ini, tapi kekurangannya adalah kami tidak bisa melihat ibadah yang kami lakukan pada hari sebelumnya. Kemudian kami membuat tracking ini di Microsoft Excel, tetapi menurut kami untuk pengolahan data di Excel cukup sulit dan susah untuk mengaitkan antara item satu dengan yang lainnya. Akhirnya, kami memutuskan untuk membuat Aplikasi Ramadan Daily Tracking ini.",
      projectImage: AssetImage("assets/project/flutter-web-portofolio.png"),
      url: "https://github.com",
    ),
    ProjectCard(
      projectName: "Ramadhan Daily Tracking App",
      techStack: [
        AssetImage("assets/icons/flutter.png"),
      ],
      developOn: DateTime.now(),
      projectDesc:
          "Aplikasi android yang kami buat berdasarkan keresahan kami dalam melacak aktivitas ibadah dalam bulan Ramadan. Awalnya kami menggunakan google form untuk melakukan tracking ini, tapi kekurangannya adalah kami tidak bisa melihat ibadah yang kami lakukan pada hari sebelumnya. Kemudian kami membuat tracking ini di Microsoft Excel, tetapi menurut kami untuk pengolahan data di Excel cukup sulit dan susah untuk mengaitkan antara item satu dengan yang lainnya. Akhirnya, kami memutuskan untuk membuat Aplikasi Ramadan Daily Tracking ini.",
      projectImage: AssetImage("assets/project/ramadhan-daily-tracking.png"),
      url: "https://nsgrdev.com/ramadan-daily-tracking",
    ),
    ProjectCard(
      projectName: "Tailwind Web Portfolio",
      techStack: [
        AssetImage("assets/icons/tailwind.png"),
      ],
      developOn: DateTime.now(),
      projectDesc:
          "Aplikasi android yang kami buat berdasarkan keresahan kami dalam melacak aktivitas ibadah dalam bulan Ramadan. Awalnya kami menggunakan google form untuk melakukan tracking ini, tapi kekurangannya adalah kami tidak bisa melihat ibadah yang kami lakukan pada hari sebelumnya. Kemudian kami membuat tracking ini di Microsoft Excel, tetapi menurut kami untuk pengolahan data di Excel cukup sulit dan susah untuk mengaitkan antara item satu dengan yang lainnya. Akhirnya, kami memutuskan untuk membuat Aplikasi Ramadan Daily Tracking ini.",
      projectImage: AssetImage("assets/project/tailwind-web-portofolio.png"),
      url: "https://github.com/dikialfin/tailwind-test",
    ),
  ];

  Widget largeScreen() => WebSmoothScroll(
      controller: scrollController,
      child: SingleChildScrollView(
        controller: scrollController,
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: listProject,
        ),
      ));

  Widget smallScreen() => Column(
        children: listProject,
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: BlocBuilder<ScreenCubit, ScreenState>(
        builder: (context, state) {
          return state is ScreenExtraSmall || state is ScreenSmall
              ? smallScreen()
              : largeScreen();
        },
      ),
    );
  }
}
