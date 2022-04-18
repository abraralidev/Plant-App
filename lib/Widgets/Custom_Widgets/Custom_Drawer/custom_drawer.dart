// ignore_for_file: camel_case_types
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plantapp/Screens/SignIn/sign_in.dart';
import 'package:plantapp/Widgets/Custom_Widgets/Custom_Drawer/drawer_items.dart';
import 'package:plantapp/model/user_model.dart';

class Custom_Drawer extends StatefulWidget {
  const Custom_Drawer({Key? key}) : super(key: key);

  @override
  State<Custom_Drawer> createState() => _Custom_DrawerState();
}

class _Custom_DrawerState extends State<Custom_Drawer> {
  User? user = FirebaseAuth.instance.currentUser;

  UserModel loggedinUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedinUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Drawer(
        backgroundColor: Colors.transparent,
        child: Material(
          borderOnForeground: true,
          borderRadius: BorderRadius.circular(40),
          elevation: 5,
          color: Colors.green,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24.0, 80, 24, 0),
            child: Column(
              children: [
                headerWidget(),
                const SizedBox(
                  height: 40,
                ),
                const Divider(
                  thickness: 2,
                  height: 10,
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 40,
                ),
                Drawer_Items(
                    name: "Flowers Plant",
                    icon: Icons.book_outlined,
                    onPressed: () {}),
                const SizedBox(
                  height: 20,
                ),
                Drawer_Items(
                    name: "Fruit Plant",
                    icon: Icons.collections_outlined,
                    onPressed: () {}),
                const SizedBox(
                  height: 20,
                ),
                Drawer_Items(
                    name: "Plant Collection",
                    icon: Icons.collections_outlined,
                    onPressed: () {}),
                const SizedBox(
                  height: 20,
                ),
                Drawer_Items(
                    name: "sale's",
                    icon: Icons.grade_outlined,
                    onPressed: () {}),
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  thickness: 2,
                  height: 10,
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 30,
                ),
                Drawer_Items(
                    name: "Settings",
                    icon: Icons.settings_outlined,
                    onPressed: () {}),
                Drawer_Items(
                    name: "Log Out",
                    icon: Icons.logout_outlined,
                    onPressed: () {
                      // showConfirmLogout();
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget headerWidget() {
    return Row(
      children: [
        const CircleAvatar(
          child: Icon(
            Icons.person,
            size: 60,
          ),
          radius: 50,
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${loggedinUser.firstname}",
                style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 10,
            ),
            Text("${loggedinUser.email}",
                style: const TextStyle(fontSize: 14, color: Colors.white))
          ],
        )
      ],
    );
  }

  showConfirmLogout() {
    showCupertinoModalPopup(
        context: context,
        builder: (context) => CupertinoActionSheet(
            message: const Text("Would you like to sign out?"),
            actions: [
              CupertinoActionSheetAction(
                onPressed: () {
                  Get.to(() => const Sign_In());
                },
                child: const Text(
                  "Sign Out",
                  style: TextStyle(color: Colors.red),
                ),
              )
            ],
            cancelButton: CupertinoActionSheetAction(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )));
  }
}
