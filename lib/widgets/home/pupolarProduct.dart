import 'package:coda_workshop/constant/colors.dart';
import 'package:coda_workshop/controllers/home_controller.dart';
import 'package:flutter/material.dart';

class PopularList extends StatelessWidget {
  final HomeController controller;

  PopularList({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(right: 20.0, left: 20, top: 0, bottom: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Popular Products",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              MaterialButton(
                onPressed: () {},
                child: Text(
                  "See more",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      fontSize: 16),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.popular.length,
            itemBuilder: (context, index) {
              final popularItem = controller.popular[index];
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 6.0, left: 20),
                    child: Container(
                        height: 110,
                        width: 110,
                        decoration: BoxDecoration(
                          color: AppColors.lightGrey,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Image.network(
                            popularItem.featuredImage!,
                            fit: BoxFit.contain,
                            // color: Colors.black12,
                          ),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 15.0,
                    ),
                    child: Text(
                      textWidthBasis: TextWidthBasis.longestLine,
                      popularItem.title!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
