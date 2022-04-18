import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantapp/utils/constanst.dart';

class TopUserInfo extends StatelessWidget {
  const TopUserInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      delay: const Duration(milliseconds: 600),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          width: w,
          height: h / 8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage("assets/images/me.jpg")),
              const SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Abrar Ali",
                    style: GoogleFonts.oxygen(
                      color: Colors.green,
                      fontSize: 22,
                    ),
                  ),
                  Text(
                    "Mid Level Flutter Developer",
                    style: GoogleFonts.oxygen(
                      color: Colors.grey,
                      fontWeight: FontWeight.w200,
                      fontSize: 16,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

