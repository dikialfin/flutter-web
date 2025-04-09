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
      projectName: "Website URL Shortener",
      techStack: [
        AssetImage("assets/icons/laravel.png"),
        AssetImage("assets/icons/tailwind.png"),
      ],
      developOn: DateTime.now(),
      projectDesc:
          "Sebuah website yang dapat mempermudah penggunanya untuk menyingkat url link yang panjang menjadi sebuah url link yang singkat. Website ini dikembangkan menggunakan Laravel 10 dan tailwind.",
      projectImage: AssetImage("assets/project/linkly_web.png"),
      url: "https://linkly.dikialfin.com/",
    ),
    ProjectCard(
      projectName: "Instagram Comment Assistant",
      techStack: [
        AssetImage("assets/icons/laravel.png"),
      ],
      developOn: DateTime.now(),
      projectDesc:
          "Sebuah webhook yang membuat akun instagram penggunanya dapat membalas komentar orang lain secara otomatis. webhook ini di kembangkan menggunakan laravel 10 dan gemini ai.",
      projectImage: AssetImage("assets/project/comment_assist.png"),
      url:
          "https://www.instagram.com/reel/C-WzSBnBxUy/?utm_source=ig_web_copy_link&igsh=MzRlODBiNWFlZA%3D%3D",
    ),
    ProjectCard(
      projectName: "Flutter Web Portfolio",
      techStack: [
        AssetImage("assets/icons/flutter.png"),
      ],
      developOn: DateTime.now(),
      projectDesc:
          "Sebuah portfolio web yang di bangun menggunakan framework flutter",
      projectImage: AssetImage("assets/project/flutter-web-portofolio.png"),
      url: "https://github.com/dikialfin/flutter-web",
    ),
    ProjectCard(
      projectName: "Ramadhan Daily Tracking App",
      techStack: [
        AssetImage("assets/icons/flutter.png"),
      ],
      developOn: DateTime.now(),
      projectDesc:
          "Sebuah aplikasi android yang bertujuan untuk mencatat aktivitas ibadah selama bulan puasa",
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
          "Sebuah web portfolio responsive yang di bangun menggunakan tailwind css",
      projectImage: AssetImage("assets/project/tailwind-web-portofolio.png"),
      url: "https://github.com/dikialfin/tailwind-test",
    ),
    ProjectCard(
      projectName: "Sistem Informasi Ikan Cupang",
      techStack: [
        AssetImage("assets/icons/flutter.png"),
      ],
      developOn: DateTime.now(),
      projectDesc:
          "Aplikasi system informasi ikan cupang membantu para pengguna nya untuk mendapatkan informasi mengenai berbagai jenis ikan cupang serta tips dalam perawatan nya. Aplikasi ini berbasis android dan di kembangkan menggunakan framework flutter",
      projectImage: AssetImage("assets/project/cupang_apps.png"),
      url: "https://github.com/dikialfin/cupangapps",
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
