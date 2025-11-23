import 'package:coda_workshop/models/products_model.dart';
import 'package:flutter/material.dart';


class ProductDetails extends StatelessWidget {
  final ProductModel product;

  const ProductDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                product.image,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            Text(
              product.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(children: [
            Text(
              "${product.price} \$",
              style: TextStyle(fontSize: 22, color: Colors.orange),
            ),




                Icon(product.favorite as IconData?)
            ])
          ],
        ),
      ),
    );
  }
}