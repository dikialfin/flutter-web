import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:web_portofolio/cubit/screen_cubit.dart';
import 'dart:html' as html;

class ProjectCard extends StatefulWidget {
  final String projectName;
  final String projectDesc;
  final List<AssetImage> techStack;
  final DateTime developOn;
  final AssetImage projectImage;
  final String url;
  ProjectCard(
      {super.key,
      required this.projectName,
      required this.projectDesc,
      required this.techStack,
      required this.developOn,
      required this.projectImage,
      required this.url});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  Color? backgroundColor = null;

  Widget postImage({required ScreenState screen}) => Container(
        width: screen is ScreenExtraSmall || screen is ScreenSmall
            ? MediaQuery.of(context).size.width * 0.5
            : MediaQuery.of(context).size.width,
        height: screen is ScreenExtraSmall || screen is ScreenSmall
            ? MediaQuery.of(context).size.width * 0.3
            : MediaQuery.of(context).size.width * 0.07,
        decoration: BoxDecoration(
            image:
                DecorationImage(image: widget.projectImage, fit: BoxFit.cover)),
      );

  Widget post() => Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(
            onPressed: () {
              html.window.open(widget.url, "_blank");
            },
            child: Text(
              "${widget.projectName} ->",
              style: GoogleFonts.poppins(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
            style: ButtonStyle(
                padding: WidgetStatePropertyAll(EdgeInsets.zero),
                overlayColor: WidgetStateColor.transparent),
          ),
          Text(
            DateFormat("dd-MM-yyyy").format(widget.developOn),
            style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.white70,
                fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            widget.projectDesc,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.white70,
                fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: List.generate(
              widget.techStack.length,
              (index) => Container(
                width: 20,
                height: 20,
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                    image: DecorationImage(image: widget.techStack[index])),
              ),
            ),
          )
        ],
      );

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) {
        setState(() {
          backgroundColor = Colors.white.withOpacity(0.1);
        });
      },
      onExit: (event) {
        setState(() {
          backgroundColor = null;
        });
      },
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.only(top: 20),
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: backgroundColor),
        child: BlocBuilder<ScreenCubit, ScreenState>(
          builder: (context, state) {
            return state is ScreenExtraSmall || state is ScreenSmall
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      postImage(screen: state),
                      SizedBox(
                        height: 20,
                      ),
                      post()
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        flex: 1,
                        child: postImage(screen: state),
                      ),
                      Flexible(
                        flex: 3,
                        child: Container(
                          padding: EdgeInsets.only(left: 20),
                          child: post(),
                        ),
                      )
                    ],
                  );
          },
        ),
      ),
    );
  }
}
