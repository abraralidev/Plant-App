import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantapp/Widgets/GreenSection/components.dart';
import 'package:plantapp/controllers/wallet_controller.dart';
import 'package:plantapp/utils/constanst.dart';

class GreenSection extends StatelessWidget {
  const GreenSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      delay: const Duration(milliseconds: 1600),
      child: Container(
        width: w,
        height: h / 5,
        decoration: const BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ComponentsOfgreenSection(
              title: Text(
                "10%",
                style: GoogleFonts.oxygen(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 35),
              ),
              subtitle: "Discount",
            ),
            ComponentsOfgreenSection(
              title: Text(
                "${Get.find<WalletController>().walletFood.length}",
                style: GoogleFonts.oxygen(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 35),
              ),
              subtitle: "Total Items",
            ),
            ComponentsOfgreenSection(
              title: Text(
                "\$${Get.find<WalletController>().totalAmount().toInt()}",
                style: GoogleFonts.oxygen(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 35),
              ),
              subtitle: "Total price",
            ),
          ],
        ),
      ),
    );
  }
}