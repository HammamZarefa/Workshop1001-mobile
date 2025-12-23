import 'package:coda_workshop/constant/ImageAssets.dart';
import 'package:coda_workshop/constant/colors.dart';
import 'package:coda_workshop/controllers/cart_controller.dart';
import 'package:coda_workshop/widgets/checkout_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

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
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Your Cart", style: TextStyle(fontSize: 17)),
            GetBuilder<CartController>(
              builder: (c) => Text(
                "${c.serverCart?.items?.length ?? 0} items",
                style: TextStyle(fontSize: 14),
              ),
            )
          ],
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GetBuilder<CartController>(
          builder: (controller) {
            final items = controller.serverCart?.items ?? [];
            if (controller.isLoading == true) {
              return Center(child: Lottie.asset(ImageAssets.cartLottie));
            }
            if (items.isEmpty) {
              return Center(child: Text("Cart is empty"));
            }

            return ListView(
              children: [
                SizedBox(
                  height: 500,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final item = items[index];

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
                              onPressed: (_) async {
                                await controller.deleteItem(item.id!);
                              },
                              backgroundColor: Colors.red.shade50,
                              foregroundColor: Colors.red.shade300,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.delete_outlined, size: 30),
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
                                child: Image.network(
                                  item.product?.image ??
                                      "https://via.placeholder.com/100",
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.product?.title ?? "No title",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(height: 5),
                                    Row(
                                      children: [
                                        Text(
                                          "\$${item.price ?? '0'}",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.primary,
                                          ),
                                        ),
                                        Text(
                                          " x${item.quantity ?? '1'}",
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
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                SizedBox(height: 10),
                // voucher
                Row(
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
                    SizedBox(width: 150),
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
                                  style: TextStyle(color: AppColors.primary),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  final code = voucherCtrl.text.trim();
                                  controller.applyVoucher(code);
                                },
                                child: Text(
                                  "Apply",
                                  style: TextStyle(color: AppColors.primary),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),

                SizedBox(height: 20),
                // total+checkout
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total:\n\$${controller.totalPrice.toStringAsFixed(2)}",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                    Container(
                      width: 170,
                      height: 47,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17),
                        color: AppColors.primary,
                      ),
                      child: FloatingActionButton(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        onPressed: () {
                          Get.defaultDialog(
                            title: "Choose Payment Method",
                            content: Column(
                              children: [
                                ListTile(
                                  leading: Icon(Icons.money),
                                  title: Text("Cash on Delivery"),
                                  onTap: () {
                                    Get.dialog(
                                      CheckoutDialog(
                                          items: controller.serverCart?.items ??
                                              []),
                                    );
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                        child: Text(
                          "Check Out",
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
