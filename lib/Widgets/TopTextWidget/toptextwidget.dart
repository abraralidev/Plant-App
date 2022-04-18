
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantapp/utils/constanst.dart';

class TopTextWidget extends StatelessWidget {
  const TopTextWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: w,
      height: h / 10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeInDown(
            delay: const Duration(milliseconds: 400),
            child: Text(
              "Beautiful Plants",
              style: GoogleFonts.oxygen(
                fontSize: 35,
                color: Colors.green,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          FadeInDown(
            delay: const Duration(milliseconds: 600),
            child: Text(
              " We sell fresh Plants",
              style: GoogleFonts.oxygen(
                fontSize: 18,
                color: const Color.fromARGB(255, 92, 92, 92),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}