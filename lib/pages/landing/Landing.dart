import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_portofolio/cubit/screen_cubit.dart';
import 'package:web_portofolio/pages/landing/section/containt.dart';
import 'package:web_portofolio/pages/landing/section/sidemenu.dart';
import 'package:web_portofolio/pages/landing/section/topnav.dart';

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    context.read<ScreenCubit>().setScreen(context);
    return Scaffold(body: BlocBuilder<ScreenCubit, ScreenState>(
      builder: (context, state) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/video.gif"), fit: BoxFit.cover)),
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.black.withOpacity(0.5),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                padding:
                    EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Topnav(), Containt(), Sidemenu()],
                ),
              )
            ],
          ),
        );
      },
    ));
  }
}
