import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:plantapp/controllers/plant_controller.dart';
import 'package:plantapp/controllers/switch_controller.dart';
import 'package:plantapp/utils/constanst.dart';

class TopImage extends StatelessWidget {
  const TopImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _controller = Get.find<SwitchController>();
    return Spin(
      delay: const Duration(milliseconds: 200),
      child: SizedBox(
        width: w,
        height: h / 2.3,
        child: Hero(
            tag: Get.find<PlantController>()
                .flowers[_controller.currentSaladIndex]
                .id,
            child: Image.asset(
              Get.find<PlantController>()
                  .flowers[_controller.currentSaladIndex]
                  .img,
            )),
      ),
    );
  }
}