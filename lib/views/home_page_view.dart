import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../controllers/product_controller.dart';
import '../widgets/product_tile.dart';

class HomePageView extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: const Icon(Icons.arrow_back_ios),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: const [
                Expanded(
                  child: Text(
                    "ShopMe",
                    style: TextStyle(
                        fontFamily: "avenir",
                        fontSize: 32,
                        fontWeight: FontWeight.w900),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(
              () {
                if (productController.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return GridView.builder(
                    itemCount: productController.productList.length,
                    itemBuilder: (context, index) {
                      return ProductTile(productController.productList[index]);
                    },
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
