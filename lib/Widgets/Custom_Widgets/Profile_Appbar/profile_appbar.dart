import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:plantapp/controllers/navigator_controllers.dart';

class UserProfileAppBar extends StatelessWidget with PreferredSizeWidget {
  const UserProfileAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);
  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      delay: const Duration(milliseconds: 100),
      child: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.menu_rounded,
            color: Colors.green,
            size: 35,
          ),
          onPressed: () {},
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              onPressed: () {
                Get.find<NavigatorController>().currentIndex.value = 1;
              },
              icon: const Icon(
                LineIcons.shoppingCart,
                color: Colors.green,
                size: 35,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
