import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:plantapp/Widgets/BottomPlantGridView/bottom_plants.dart';
import 'package:plantapp/Widgets/Custom_Widgets/Custom_Drawer/custom_drawer.dart';
import 'package:plantapp/Widgets/MiddlePlantsPageView/middle_plants_view.dart';

import 'package:plantapp/Widgets/TopTextWidget/toptextwidget.dart';
import 'package:plantapp/controllers/tabbar_controller.dart';
import 'package:plantapp/utils/constanst.dart';
import '../../Widgets/Custom_Widgets/otherAppbar/other_appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const Custom_Drawer(),
        appBar: const MyAppBar(),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const TopTextWidget(),
                TabBar(),
                const MiddlePlantsPageView(),
                const BottomPlantGridView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TabBar extends StatelessWidget {
  TabBar({
    Key? key,
  }) : super(key: key);

  final List<String> tabNames = [
    "Flowers",
    "Baskets",
    "Roses",
    "Gifts",
  ];

  @override
  Widget build(BuildContext context) {
    var _controller = Get.find<TabBarController>();
    return FadeInDown(
      delay: const Duration(milliseconds: 800),
      child: Container(
        margin: const EdgeInsets.only(top: 10, bottom: 5),
        width: w,
        height: h / 13,
        child: Row(
          children: [
            SizedBox(
              width: w / 1.25,
              height: double.infinity,
              child: ListView.builder(
                  itemCount: 4,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index) {
                    return Obx(() {
                      return GestureDetector(
                        onTap: () {
                          _controller.currentIndex.value = index;
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          width: w / 4,
                          height: double.infinity,
                          margin: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: _controller.currentIndex.value == index
                                ? Colors.green
                                : unSelectedColor,
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Center(
                              child: Text(
                            tabNames[index],
                            style: GoogleFonts.oxygen(
                                color: _controller.currentIndex.value == index
                                    ? const Color.fromARGB(255, 234, 234, 234)
                                    : Colors.green,
                                fontSize: 16),
                          )),
                        ),
                      );
                    });
                  }),
            ),
            Expanded(
              child: RotatedBox(
                quarterTurns: -15,
                child: IconButton(
                  icon: const Icon(
                    LineIcons.horizontalSliders,
                    size: 40,
                    color: Colors.green,
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
