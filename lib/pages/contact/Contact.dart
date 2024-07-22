import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:web_portofolio/pages/contact/section/contact.dart';
import 'package:web_portofolio/pages/contact/section/head.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff101010),
      body: WebSmoothScroll(
          controller: scrollController,
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            controller: scrollController,
            child: Container(
              padding: const EdgeInsets.all(30),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                  const Head(),
                  const SizedBox(
                    height: 112,
                  ),
                  const ContactCard()
                ],
              ),
            ),
          )),
    );
  }
}
