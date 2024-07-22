import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:web_portofolio/cubit/language_cubit.dart';
import 'package:web_portofolio/pages/about/widgets/school_container.dart';

class Education extends StatefulWidget {
  const Education({super.key});

  @override
  State<Education> createState() => _EducationState();
}

class _EducationState extends State<Education> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, LanguageState>(
      builder: (context, state) {
        return Column(
          children: [
            Text(
              state is Indonesian ? "Pendidikan" : "Education",
              style: GoogleFonts.poppins(
                  fontSize: 46,
                  color: Colors.white,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: 600,
              child: Column(
                children: [
                  TimelineTile(
                    alignment: TimelineAlign.manual,
                    lineXY: 0.1,
                    isFirst: false,
                    indicatorStyle: const IndicatorStyle(
                      width: 20,
                    ),
                    endChild: School(
                        schoolName: "Universitas Muhammadiyah Prof.DR Hamka",
                        major: state is Indonesian
                            ? "Teknik Informatika"
                            : "Informatics Engineering",
                        periode: state is Indonesian
                            ? "2021 - Sekarang"
                            : "2021 - Now",
                        crosAxisIsStart: true),
                  ),
                  const TimelineDivider(
                    begin: 0.1,
                    end: 0.9,
                  ),
                  TimelineTile(
                    alignment: TimelineAlign.manual,
                    lineXY: 0.9,
                    isLast: true,
                    startChild: School(
                        schoolName: state is Indonesian
                            ? "SMK Nasional Depok"
                            : "Depok National High School",
                        major: state is Indonesian
                            ? "Teknik Komputer Dan Jaringan"
                            : "Computer and Network Engineering",
                        periode: "2013 - 2016",
                        crosAxisIsStart: false),
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
