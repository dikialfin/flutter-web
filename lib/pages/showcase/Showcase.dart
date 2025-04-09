import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:web_portofolio/cubit/screen_cubit.dart';
import 'package:web_portofolio/pages/showcase/section/headlines.dart';
import 'package:web_portofolio/pages/showcase/section/projects.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';

class Showcase extends StatefulWidget {
  const Showcase({super.key});

  @override
  State<Showcase> createState() => _ShowcaseState();
}

class _ShowcaseState extends State<Showcase> {
  ScrollController scrollController = ScrollController();
  Offset _mousePosition = Offset.zero;
  @override
  Widget build(BuildContext context) {
    context.read<ScreenCubit>().setScreen(context);
    return Scaffold(
      backgroundColor: Color(0xff101010),
      body: MouseRegion(
        onHover: (event) {
          setState(() {
            _mousePosition = event.position;
          });
        },
        child: Stack(
          children: [
            Transform.translate(
              offset: _mousePosition - Offset(200, 200),
              child: Container(
                width: 400,
                height: 400,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromARGB(255, 43, 43, 43).withOpacity(0.5),
                        blurRadius: 100,
                        spreadRadius: 100)
                  ],
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(30),
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
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height - 100,
                    padding: EdgeInsets.all(30),
                    child: BlocBuilder<ScreenCubit, ScreenState>(
                      builder: (context, state) {
                        return state is ScreenExtraSmall || state is ScreenSmall
                            ? WebSmoothScroll(
                                controller: scrollController,
                                child: SingleChildScrollView(
                                  controller: scrollController,
                                  child: Column(
                                    children: [
                                      Headlines(),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Projects()
                                    ],
                                  ),
                                ))
                            : Row(
                                children: [
                                  Flexible(flex: 1, child: Headlines()),
                                  Flexible(flex: 1, child: Projects()),
                                ],
                              );
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
