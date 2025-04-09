import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:web_portofolio/cubit/screen_cubit.dart';
import 'package:web_portofolio/pages/about/section/about.dart';
import 'package:web_portofolio/pages/about/section/education.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    context.read<ScreenCubit>().setScreen(context);
    return Scaffold(
      backgroundColor: const Color(0xff101010),
      body: WebSmoothScroll(
          controller: scrollController,
          child: SingleChildScrollView(
            controller: scrollController,
            child: Container(
              padding: const EdgeInsets.all(30),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(
                            FontAwesomeIcons.caretLeft,
                            color: Colors.white,
                            size: 20,
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  AboutMe(),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: double.maxFinite,
                    height: 2,
                    color: Colors.white70,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Education()
                ],
              ),
            ),
          )),
    );
  }
}
