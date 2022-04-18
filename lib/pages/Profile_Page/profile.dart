// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:plantapp/Widgets/BottomSection/bottom_section.dart';
import 'package:plantapp/Widgets/Custom_Widgets/Profile_Appbar/profile_appbar.dart';
import 'package:plantapp/Widgets/GreenSection/green_section.dart';
import 'package:plantapp/Widgets/TopUserInfo/top_user_info.dart';
import '../../utils/constanst.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const UserProfileAppBar(),
        body: Column(
          children: [
            const TopUserInfo(),
            Container(
              margin: const EdgeInsets.only(top: 10),
              width: w,
              height: h / 1.6,
              child: Stack(children: [
                const GreenSection(),
                BottomSection(),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

