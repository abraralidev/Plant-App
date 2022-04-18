import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantapp/controllers/plant_controller.dart';
import 'package:plantapp/controllers/switch_controller.dart';
import 'package:plantapp/utils/constanst.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _controller = Get.find<SwitchController>();

    return SizedBox(
      width: w,
      height: h / 15,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FadeInDown(
            delay: const Duration(milliseconds: 300),
            child: SizedBox(
              width: w / 1.6,
              child: Text(
                Get.find<PlantController>()
                    .flowers[_controller.currentSaladIndex]
                    .title,
                style: GoogleFonts.oxygen(
                  fontSize: Get.find<PlantController>()
                              .flowers[_controller.currentSaladIndex]
                              .title
                              .length <=
                          13
                      ? 26
                      : 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 1),
            width: w / 3.4,
            height: h / 18,
            child: Row(
              children: [
                FadeInLeft(
                  delay: const Duration(milliseconds: 400),
                  child: CircleAvatar(
                    backgroundColor: Colors.green,
                    child: IconButton(
                      onPressed: () {
                        Get.find<PlantController>()
                            .addQ(_controller.currentSaladIndex);
                      },
                      icon: const Icon(
                        Icons.add,
                        size: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                FadeInUp(
                  delay: const Duration(milliseconds: 700),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 9),
                      child: GetBuilder<PlantController>(
                          id: "quantity",
                          builder: (context) {
                            return Text(
                              Get.find<PlantController>()
                                  .flowers[_controller.currentSaladIndex]
                                  .quantity
                                  .toString(),
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            );
                          })),
                ),
                FadeInRight(
                  delay: const Duration(milliseconds: 600),
                  child: CircleAvatar(
                    backgroundColor: Colors.green,
                    child: IconButton(
                      onPressed: () {
                        Get.find<PlantController>()
                            .removeQ(_controller.currentSaladIndex);
                      },
                      icon: const Icon(
                        Icons.remove,
                        size: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}