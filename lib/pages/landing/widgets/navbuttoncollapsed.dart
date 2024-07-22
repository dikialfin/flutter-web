import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:popover/popover.dart';
import 'package:web_portofolio/cubit/screen_cubit.dart';
import 'package:web_portofolio/pages/about/About.dart';
import 'package:web_portofolio/pages/contact/Contact.dart';
import 'package:web_portofolio/pages/showcase/Showcase.dart';
import 'package:web_portofolio/route_builder.dart';

class NavButtonCollapsed extends StatefulWidget {
  const NavButtonCollapsed({super.key});

  @override
  State<NavButtonCollapsed> createState() => _NavButtonCollapsedState();
}

class _NavButtonCollapsedState extends State<NavButtonCollapsed> {
  bool menuIsOpened = false;
  double? iconSize = 15;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScreenCubit, ScreenState>(
      builder: (context, state) {
        if (state is ScreenExtraSmall) {
          iconSize = state.width * 0.03;
        }

        if (state is ScreenSmall) {
          iconSize = null;
        }

        return IconButton(
          onPressed: () {
            setState(() {
              menuIsOpened = true;
            });
            showPopover(
                context: context,
                width: 150,
                height: 50,
                direction: PopoverDirection.left,
                backgroundColor: Colors.transparent,
                onPop: () {
                  setState(() {
                    menuIsOpened = false;
                  });
                },
                bodyBuilder: (context) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.of(context)
                                  .push(createRoute(page: About()));
                            },
                            icon: Icon(
                              FontAwesomeIcons.user,
                              color: Colors.white,
                              size: iconSize,
                            )),
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.of(context)
                                  .push(createRoute(page: Contact()));
                            },
                            icon: Icon(
                              FontAwesomeIcons.addressBook,
                              color: Colors.white,
                              size: iconSize,
                            )),
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.of(context)
                                  .push(createRoute(page: Showcase()));
                            },
                            icon: Icon(
                              FontAwesomeIcons.laptopCode,
                              color: Colors.white,
                              size: iconSize,
                            )),
                      ],
                    ));
          },
          icon: Icon(
            menuIsOpened ? Icons.close_outlined : FontAwesomeIcons.bars,
            size: iconSize,
          ),
          color: Colors.white,
        );
      },
    );
  }
}
