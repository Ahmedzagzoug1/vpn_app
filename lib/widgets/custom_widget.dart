import 'package:flutter/material.dart';
import 'package:vpn_basic_project/main.dart';

class CustomWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget RoundedWidgetWithIcon;
  const CustomWidget(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.RoundedWidgetWithIcon});

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.sizeOf(context);
    return SizedBox(
      width: screenSize.width * 0.25,
      child: Column(
        
        children: [
          RoundedWidgetWithIcon,
          const SizedBox(
            height: 16,
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 7,
          ),
          Text(
            subtitle,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          )
      ]),
    );
  }
}
