import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantapp/utils/constanst.dart';

// ignore: must_be_immutable
class BottomSection extends StatelessWidget {
  BottomSection({
    Key? key,
  }) : super(key: key);

  List<String> performances = [
    "Orders History",
    "Payment methode",
    "Tracking",
    "Statistics",
    "Settings",
    "Log Out"
  ];

  List<String> imagePath = [
    'assets/images/his.png',
    'assets/images/pay.png',
    'assets/images/tr.png',
    'assets/images/stas.png',
    'assets/images/set.png',
    'assets/images/log.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: FadeInUp(
        delay: const Duration(milliseconds: 900),
        child: Container(
          width: w,
          height: h / 2.2,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          ),
          child: GridView.builder(
              itemCount: 6,
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.99,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: FadeInUp(
                    delay: Duration(milliseconds: 1010 * index ~/ 1.5),
                    child: Container(
                      margin: const EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border:
                              Border.all(color: unSelectedColor, width: 1.5)),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FadeInUp(
                              delay:
                                  Duration(milliseconds: 1200 * index ~/ 1.5),
                              child: SizedBox(
                                  width: 100,
                                  height: 100,
                                  child: Image.asset(imagePath[index])),
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            FadeInUp(
                              delay: Duration(
                                milliseconds: 1400 * index ~/ 1.5,
                              ),
                              child: Text(performances[index],
                                  style: GoogleFonts.lato(
                                      color: const Color.fromARGB(
                                          255, 117, 117, 117),
                                      fontSize: 16)),
                            )
                          ]),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}