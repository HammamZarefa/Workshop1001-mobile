import 'package:coda_workshop/constant/colors.dart';
import 'package:coda_workshop/controllers/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SlideAble extends StatelessWidget {
  final CartController controller;

  SlideAble({super.key, required this.controller});
  @override 
  Widget build(BuildContext context) {
    return Container(
      height: 530,
      child: ListView.builder(itemBuilder: (context, index) {
        final item = controller.localProducts[index];
        Slidable(
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
                  controller.deleteProduct(item.id!);
                },
                backgroundColor: Colors.red.shade50,
                foregroundColor: Colors.red.shade300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.delete_outlined,
                      size: 30,
                    ),
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
                  child: Image.asset(item.image, fit: BoxFit.contain),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.name,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500)),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Text(
                            "\$${item.price}",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: AppColors.primary,
                            ),
                          ),
                          Text(
                            " x${item.count}",
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
      }),
    );
    
  }
}
