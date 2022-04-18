import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantapp/Pages/Details_Page/details.dart';
import 'package:plantapp/controllers/plant_controller.dart';
import 'package:plantapp/controllers/switch_controller.dart';
import 'package:plantapp/controllers/wallet_controller.dart';

import 'package:plantapp/utils/constanst.dart';

class BottomPlantGridView extends StatelessWidget {
  const BottomPlantGridView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _controller = Get.find<SwitchController>();
    var _foodController = Get.find<PlantController>();
    return SingleChildScrollView(
      child: SizedBox(
        width: w,
        height: h / 2.9,
        child: GridView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: _foodController.flowers.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.75,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  _controller.currentSaladIndex = index;
                  Get.to(() => const DetailsPage());
                },
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  margin: const EdgeInsets.all(10),
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 10,
                        child: FadeInDown(
                          delay: const Duration(milliseconds: 1500),
                          child: Container(
                            width: w / 2.4,
                            height: h / 4,
                            decoration: BoxDecoration(
                                color: unSelectedColor,
                                borderRadius: BorderRadius.circular(60)),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 15,
                        child: FadeInDown(
                          delay: const Duration(milliseconds: 1600),
                          child: Spin(
                            delay: const Duration(milliseconds: 1650),
                            child: SizedBox(
                              width: w / 2.8,
                              height: h / 5.5,
                              child: Center(
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
                        left: 10,
                        top: 130,
                        child: FadeInDown(
                          delay: const Duration(milliseconds: 1700),
                          child: SizedBox(
                            width: w / 2.7,
                            height: h / 30,
                            child: Center(
                              child: Text(
                                _foodController.flowers[index].title,
                                style: GoogleFonts.oxygen(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 19),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 25,
                        top: 155,
                        child: FadeInDown(
                          delay: const Duration(milliseconds: 1800),
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
                        left: 55,
                        top: 185,
                        child: FadeInDown(
                          delay: const Duration(milliseconds: 1900),
                          child: Text(
                            "\$${_foodController.flowers[index].price.toStringAsFixed(2)}",
                            style: GoogleFonts.oxygen(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 5,
                        bottom: 7,
                        child: FadeInUp(
                          delay: const Duration(milliseconds: 1950),
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
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}