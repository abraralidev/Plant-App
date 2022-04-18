import 'package:flutter/material.dart';
import 'package:plantapp/Widgets/BottomPlantGridView/bottom_plants.dart';
import 'package:plantapp/Widgets/Custom_Widgets/Custom_Drawer/custom_drawer.dart';
import 'package:plantapp/Widgets/MiddlePlantsPageView/middle_plants_view.dart';
import 'package:plantapp/Widgets/TabBar/tabbar.dart';
import 'package:plantapp/Widgets/TopTextWidget/toptextwidget.dart';
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
                Tab_Bar_View(),
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

