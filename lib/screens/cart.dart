import 'package:coda_workshop/constant/colors.dart';
import 'package:coda_workshop/constant/imageAssets.dart';
import 'package:coda_workshop/controllers/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});
  final CartController controller = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.background,
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
                    "${c.serverList.length} items",
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
            if (controller.serverList.isEmpty) {
              return Center(child: Text("Cart is empty"));
            }

            return GetBuilder<CartController>(
              builder: (controller) => ListView(
                children: [
                  Container(
                    height: 530,
                    child: ListView.builder(
                      itemCount: controller.serverList.length,
                      itemBuilder: (context, index) {
                        final item = controller.serverList[index];

                        return Slidable(
                          key: ValueKey(item.id),
                          endActionPane: ActionPane(
                            motion: ScrollMotion(),
                            extentRatio: 0.15,
                            children: [
                              CustomSlidableAction(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20)),
                                onPressed: (_) {
                                  if (controller.serverList
                                      .any((e) => e.id == item.id)) {
                                    controller.deleteLocalItem(item.id!);
                                  } else {}
                                },
                                backgroundColor: Colors.red.shade50,
                                foregroundColor: Colors.red.shade300,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.delete_outlined, size: 30),
                                    SizedBox(height: 5),
                                  ],
                                ),
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
                                    color: AppColors.lightGrey,
                                  ),
                                  height: 90,
                                  width: 85,
                                  child: Image.asset(
                                      item.items![index].product?.image ??

                                          // item.product?.image ??
                                          // item.product?.image ??
                                          "",
                                      fit: BoxFit.contain),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          item.items![index].product?.title ??

                                              // item.product?.title ??
                                              // item.product?.title ??
                                              "",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500)),
                                      SizedBox(height: 5),
                                      Row(
                                        children: [
                                          Text(
                                            "\$${item.items?[index].price}",

                                            // "\$${item.price}",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.primary,
                                            ),
                                          ),
                                          Text(
                                            " x${item.items?[index].quantity }",

                                            // " x${item.quantity ?? item.quantity}",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 17,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  // SlideAble(controller: controller,),
                  Column(
                    children: [
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                color: AppColors.lightGrey,
                                borderRadius: BorderRadius.circular(40)),
                            child: Icon(
                              Icons.receipt_rounded,
                              color: AppColors.primary,
                            ),
                          ),
                          SizedBox(
                            width: 150,
                          ),
                          MaterialButton(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              "Add voucher code >",
                              style: TextStyle(fontSize: 16),
                            ),
                            onPressed: () {
                              TextEditingController voucherCtrl =
                                  TextEditingController();

                              Get.dialog(
                                AlertDialog(
                                  title: Text("Enter Voucher Code"),
                                  content: TextField(
                                    cursorColor: AppColors.primary,
                                    controller: voucherCtrl,
                                    decoration: InputDecoration(
                                      hintText: "Enter your code",
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: AppColors.primary, width: 2),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: AppColors.primary, width: 2),
                                      ),
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      child: Text(
                                        "Cancel",
                                        style:
                                            TextStyle(color: AppColors.primary),
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        final code = voucherCtrl.text.trim();
                                        controller.applyVoucher(code);
                                      },
                                      child: Text("Apply",
                                          style: TextStyle(
                                              color: AppColors.primary)),
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GetBuilder<CartController>(
                            builder: (controller) => Text(
                              "Total:\n\$${controller.totalPrice.toStringAsFixed(2)}",
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w500),
                            ),
                          ),
                          Container(
                            width: 170,
                            height: 47,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(17),
                                color: AppColors.primary),
                            child: FloatingActionButton(
                              elevation: 0,
                              backgroundColor: Colors.transparent,
                              onPressed: () {
                                controller.addToLocalCart(
                                  name: 'Wireless Controller for PS4',
                                  image: ImageAssets.facebook,
                                  count: 2,
                                  price: 200.23,
                                );

                                controller.update();
                                controller.getLocalCart();
                              },
                              child: Text(
                                "Check Out",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
//       floatingActionButton: Container(
//         width: 170,
//         height: 47,
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(17), color: AppColors.primary),
//         child: FloatingActionButton(
//           elevation: 0,
//           backgroundColor: Colors.transparent,
//           onPressed: () {
// controller.addToLocalCart(
//   name: 'Wireless Controller for PS4',
//   image: ImageAssets.facebook,
//   count: 2,
//   price: 200.23,
// );
//             controller.getLocalCart();
//           },
//           child: Text(
//             "Check Out",
//             style: TextStyle(color: Colors.white, fontSize: 17),
//           ),
//         ),
      // ),
    );
  }
}
