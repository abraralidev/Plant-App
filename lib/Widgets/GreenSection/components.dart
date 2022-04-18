import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:plantapp/utils/constanst.dart';

// ignore: must_be_immutable
class ComponentsOfgreenSection extends StatelessWidget {
  Text title;
  String subtitle;
  //
  ComponentsOfgreenSection(
      {Key? key, required this.title, required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      delay: const Duration(milliseconds: 2000),
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        width: w / 3.7,
        height: h / 7.3,
        decoration: BoxDecoration(
            color: unSelectedColor.withOpacity(0.5),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeInUp(
              child: title,
              delay: const Duration(milliseconds: 2400),
            ),
            const SizedBox(
              height: 5,
            ),
            FadeInUp(
              delay: const Duration(milliseconds: 2800),
              child: Text(subtitle,
                  style: const TextStyle(color: unSelectedColor, fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}

