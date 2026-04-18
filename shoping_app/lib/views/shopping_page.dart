import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping_app/controller/card_controller.dart';
import 'package:shoping_app/controller/shopping_controller.dart';

class ShoppingPage extends StatelessWidget {
  const ShoppingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final shoppingcontroller = Get.put(ShoppingController());
    final cardcontroller = Get.put(cardController());

    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GetX<ShoppingController>(
                builder: (controller) {
                  return ListView.builder(
                    itemCount: controller.product.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                          left: 8,
                          right: 8,
                          bottom: 4,
                          top: (index == 0) ? 3.0 : 0.0,
                        ),
                        child: Card(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8.0,
                                ),
                                child: Container(
                                  height: 150,
                                  width: double.infinity,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              controller.product[index].name,
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 8,
                                              bottom: 8,
                                            ),
                                            child: Text(
                                              controller
                                                  .product[index]
                                                  .description,
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "\$ ${controller.product[index].price}",
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),

                                          Padding(
                                            padding: const EdgeInsets.only(
                                              right: 8,
                                            ),
                                            child: ElevatedButton(
                                              onPressed: () {
                                                cardcontroller.addItems(
                                                  controller.product[index],
                                                );
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.blue,
                                                shadowColor: Colors.grey,
                                              ),
                                              child: Text(
                                                "ADD",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),

            GetX<cardController>(
              builder: (controller) {
                return Text("Total amount: \$ ${controller.totalAmount}");
              },
            ),
            SizedBox(height: 100),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.lightBlueAccent,
        onPressed: () {},
        icon: Icon(Icons.add_shopping_cart_outlined),
        label: GetX<cardController>(
          builder: (controller) {
            return Text(controller.count.toString());
          },
        ),
      ),
    );
  }
}
