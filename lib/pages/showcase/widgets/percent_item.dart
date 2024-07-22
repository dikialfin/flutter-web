import 'package:flutter/material.dart';
import 'package:web_portofolio/pages/showcase/widgets/percen_card.dart';

class PercentItem extends StatefulWidget {
  const PercentItem({super.key});

  @override
  State<PercentItem> createState() => _PercentItemState();
}

class _PercentItemState extends State<PercentItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          PercentCard(progress: 0.95, text: "HTML/CSS"),
          PercentCard(progress: 0.95, text: "Hawdawd")
        ],
      ),
    );
  }
}
