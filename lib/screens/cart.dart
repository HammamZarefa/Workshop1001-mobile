import 'package:coda_workshop/constant/colors.dart';
import 'package:coda_workshop/controllers/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class cartScreen extends StatelessWidget {
  cartScreen({super.key});
  final CartController controller = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors.background,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: appColors.background,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 145.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Your Cart",
                  style: TextStyle(fontSize: 17),
                ),
                GetBuilder<CartController>(
                  builder: (c) => Text(
                    "${c.products.length} items",
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GetBuilder<CartController>(
          builder: (controller) {
            if (controller.products.isEmpty) {
              return Center(child: Text("Cart is empty"));
            }

            return ListView.builder(
              itemCount: controller.products.length,
              itemBuilder: (context, index) {
                final item = controller.products[index];

                return Slidable(
  key: ValueKey(item.id),

  endActionPane: ActionPane(
    motion: ScrollMotion(),

    children: [
      SlidableAction(
        onPressed: (_) {
          controller.deleteProduct(item.id!);
        },
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        icon: Icons.delete,
        label: "Delete",
      ),
    ],
  ),

  child: Container(
    margin: EdgeInsets.symmetric(vertical: 8),
    child: Row(
      children: [
        Container(
          margin: EdgeInsets.only(right: 10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: appColors.lightGrey,
          ),
          height: 90,
          width: 80,
          child: Image.asset(item.image, fit: BoxFit.contain),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item.name, style: TextStyle(fontSize: 20)),
              SizedBox(height: 5),
              Text(
                "\$${item.price}  x${item.count}",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: appColors.primary,
                ),
              ),
            ],
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: appColors.pannerColor,
        onPressed: () {
          controller.addProductToCart();
          controller.getCartProducts();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
