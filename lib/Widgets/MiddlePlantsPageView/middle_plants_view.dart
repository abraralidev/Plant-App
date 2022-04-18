// ignore: file_names
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantapp/Pages/Details_Page/details.dart';
import 'package:plantapp/controllers/plant_controller.dart';
import 'package:plantapp/controllers/switch_controller.dart';
import 'package:plantapp/controllers/wallet_controller.dart';
import 'package:plantapp/utils/constanst.dart';

class MiddlePlantsPageView extends StatelessWidget {
  const MiddlePlantsPageView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _controller = Get.find<SwitchController>();
    var _foodController = Get.find<PlantController>();
    return SizedBox(
        width: w,
        height: h / 4.5,
        child: PageView.builder(
            itemCount: _foodController.flowers.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  _controller.currentSaladIndex = index;
                  Get.to(() => const DetailsPage());
                },
                child: Container(
                  margin: const EdgeInsets.all(5),
                  width: w / 1.1,
                  child: Stack(children: [
                    Positioned(
                      bottom: 10,
                      right: 0,
                      child: FadeInLeft(
                        delay: const Duration(milliseconds: 900),
                        child: Container(
                          width: w / 1.3,
                          height: h / 5.5,
                          decoration: BoxDecoration(
                              color: unSelectedColor,
                              borderRadius: BorderRadius.circular(100)),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 3,
                      child: FadeInLeft(
                        delay: const Duration(milliseconds: 1000),
                        child: Spin(
                          delay: const Duration(milliseconds: 1100),
                          child: SizedBox(
                            width: w / 3,
                            height: h / 5,
                            child: Hero(
                              tag: _foodController.flowers[index].id,
                              child: Image.asset(
                                _foodController.flowers[index].img,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 170,
                      top: 40,
                      child: FadeInDown(
                        delay: const Duration(milliseconds: 1200),
                        child: Text(
                          _foodController.flowers[index].title,
                          style: GoogleFonts.oxygen(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 171,
                      top: 68,
                      child: FadeInDown(
                        delay: const Duration(milliseconds: 1300),
                        child: Text(
                          _foodController.flowers[index].subtitle,
                          style: GoogleFonts.oxygen(
                              color: const Color.fromARGB(255, 135, 134, 134),
                              fontWeight: FontWeight.w300,
                              fontSize: 16),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 171,
                      top: 95,
                      child: FadeInDown(
                        delay: const Duration(milliseconds: 1400),
                        child: Text(
                          "\$${_foodController.flowers[index].price.toStringAsFixed(2)}",
                          style: GoogleFonts.oxygen(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 23),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 5,
                      bottom: 10,
                      child: FadeInUp(
                        delay: const Duration(milliseconds: 1450),
                        child: CircleAvatar(
                          backgroundColor: Colors.green,
                          child: IconButton(
                              onPressed: () {
                                Get.find<WalletController>().add(
                                  id: _foodController.flowers[index].id,
                                  img: _foodController.flowers[index].img,
                                  title: _foodController.flowers[index].title,
                                  subtitle:
                                      _foodController.flowers[index].subtitle,
                                  price: _foodController.flowers[index].price,
                                );
                              },
                              icon: const Icon(
                                Icons.add,
                                color: unSelectedColor,
                              )),
                        ),
                      ),
                    )
                  ]),
                ),
              );
            }));
  }
}