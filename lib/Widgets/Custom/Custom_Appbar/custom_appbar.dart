import 'package:animate_do/animate_do.dart';
import 'package:line_icons/line_icons.dart';
import 'package:plantapp/controllers/navigator_controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plantapp/controllers/wallet_controller.dart';
// ignore: camel_case_types
class Custom_Appbar extends StatelessWidget with PreferredSizeWidget {
  const Custom_Appbar({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(55);
  @override
  Widget build(BuildContext context) {
    var _walletController = Get.find<WalletController>();
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: FadeInDown(
        delay: const Duration(milliseconds: 200),
        child: IconButton(
          icon: const Icon(
            Icons.menu_rounded,
            color: Colors.green,
            size: 35,
          ),
          onPressed: () {},
        ),
      ),
      actions: [
        GetBuilder<WalletController>(builder: (context) {
          return Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: _walletController.walletFood.isNotEmpty
                  ? FadeInRight(
                      delay: const Duration(milliseconds: 300),
                      child: IconButton(
                        onPressed: () {
                          Get.defaultDialog(
                              barrierDismissible: false,
                              title: "Warning!",
                              content: const Text(
                                "Do you really wanna remove all items from this list?",
                                textAlign: TextAlign.center,
                              ),
                              confirmTextColor: Colors.white,
                              onCancel: () {},
                              onConfirm: () {
                                _walletController.removeAllItems();
                                Get.back();
                              });
                        },
                        icon: const Icon(
                          LineIcons.trash,
                          color: Colors.red,
                          size: 35,
                        ),
                      ),
                    )
                  : FadeInRight(
                      delay: const Duration(milliseconds: 400),
                      child: IconButton(
                          onPressed: () {
                            Get.find<NavigatorController>().currentIndex.value =
                                0;
                          },
                          icon: const Icon(
                            LineIcons.plusCircle,
                            color: Colors.black,
                            size: 30,
                          )),
                    ));
        }),
      ],
    );
  }
}
