import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:plantapp/Widgets/BottomPrice/bottom_price.dart';
import 'package:plantapp/Widgets/DeliveryTime/delivery_time.dart';
import 'package:plantapp/Widgets/HeaderWidget/header_widget.dart';
import 'package:plantapp/Widgets/MiddleDescription/middle_description.dart';
import '../../Widgets/TopImage/top_image.dart';
import '../../controllers/switch_controller.dart';
import '../../controllers/wallet_controller.dart';
import '../../controllers/plant_controller.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          floatingActionButton: const MyFAB(),
          appBar: const MyAppBar(),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: const [
                TopImage(),
                HeaderWidget(),
                MiddleDescription(),
                DeliveryTime(),
                BottomPrice()
              ],
            ),
          )),
    );
  }
}



/// My Custom FloatingActionButton
class MyFAB extends StatelessWidget {
  const MyFAB({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _foodController = Get.find<PlantController>();
    var _controller = Get.find<SwitchController>();
    return SizedBox(
      height: 70,
      width: 70,
      child: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          Get.find<WalletController>().add(
            id: _foodController.flowers[_controller.currentSaladIndex].id,
            img: _foodController.flowers[_controller.currentSaladIndex].img,
            title: _foodController.flowers[_controller.currentSaladIndex].title,
            subtitle:
                _foodController.flowers[_controller.currentSaladIndex].subtitle,
            price: _foodController.flowers[_controller.currentSaladIndex].price,
          );
        },
        child: const Icon(
          LineIcons.shoppingCart,
          color: Colors.white,
          size: 40,
        ),
      ),
    );
  }
}
/// AppBar Components
class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  const MyAppBar({
    Key? key,
  }) : super(key: key);
  @override
  Size get preferredSize => const Size.fromHeight(55);
  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      delay: const Duration(milliseconds: 100),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.green,
            )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
                color: Colors.green,
                size: 30,
              ))
        ],
      ),
    );
  }
}
