import 'package:get/get.dart';
//
import '../model/plants_model.dart';

class PlantController extends GetxController {
  List<PlantsModel> flowers = [
    PlantsModel(
      id: "1",
      img: "assets/images/1.png",
      title: "Red Rose",
      subtitle: "Red Rose Basket",
      price: 32.00,
      deliveryTime: "1-2 Days",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin eu leo eu ligula sodales consectetur vel sed quam. Integer placerat sollicitudin sodales. Nulla facilisi. Integer massa libero, consectetur sit amet placerat non, auctor sit amet enim.",
      quantity: 1,
    ),
    PlantsModel(
      id: "2",
      img: "assets/images/2.png",
      title: "White Rose",
      subtitle: "White and pick Rose",
      price: 24.00,
      deliveryTime: "1-2 Days",
      description:
           "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin eu leo eu ligula sodales consectetur vel sed quam. Integer placerat sollicitudin sodales. Nulla facilisi. Integer massa libero, consectetur sit amet placerat non, auctor sit amet enim.",
      quantity: 1,
    ),
    PlantsModel(
      id: "3",
      img: "assets/images/3.png",
      title: "Red Rose Plant",
      subtitle: "Beautifull Red Rose ",
      price: 24.00,
      deliveryTime: "1-2 Days",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin eu leo eu ligula sodales consectetur vel sed quam. Integer placerat sollicitudin sodales. Nulla facilisi. Integer massa libero, consectetur sit amet placerat non, auctor sit amet enim.",
      quantity: 1,
    ),
    PlantsModel(
      id: "4",
      img: "assets/images/4.png",
      title: "Pink Rose",
      subtitle: "Decorated Basket ",
      price: 29.00,
      deliveryTime: "1-2 Days",
      description:
           "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin eu leo eu ligula sodales consectetur vel sed quam. Integer placerat sollicitudin sodales. Nulla facilisi. Integer massa libero, consectetur sit amet placerat non, auctor sit amet enim.",
      quantity: 1,
    ),
  ];

  // For add 1 item from quantityes of Food
  void addQ(int index) {
    if (flowers[index].quantity < 9 && flowers[index].quantity >= 0) {
      flowers[index].quantity++;
    } else {
      Get.snackbar("Notice", "You can't add more than 9 item!");
    }
    update(["quantity"]);
  }

  // For remove 1 item from quantityes of Food
  void removeQ(int index) {
    if (flowers[index].quantity > 1 && flowers[index].quantity <= 9) {
      flowers[index].quantity--;
    } else {
      Get.snackbar("Notice", "You can't order 0 item!");
    }
    update(["quantity"]);
  }
}
