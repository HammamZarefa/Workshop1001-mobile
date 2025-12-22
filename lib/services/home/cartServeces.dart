import 'package:coda_workshop/api/api.dart';
import 'package:coda_workshop/models/cart_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CartServeces {
  Future<CartModel> GetCart() async {
    try {
      var res = await Api().dio.get(
            'api/v1/carts',
          );
      print("API Response: ${res.data}");
      return CartModel.fromJson(res.data);
    } catch (e) {
      print("Error in get cart: $e");
    }
    return CartModel();
  }

  Future<CartModel?> postCart(int productId, double price, int quantity) async {
    try {
      var res = await Api().dio.post(
        'api/v1/carts',
        data: {
          "items": [
            {
              "product_id": productId,
              "price": price,
              "quantity": quantity,
            }
          ]
        },
      );

      print("REQUEST BODY:");
      print({
        "items": [
          {
            "product_id": productId,
            "price": price,
            "quantity": quantity,
          }
        ]
      });

      return CartModel.fromJson(res.data);
    } catch (e) {
      print("Error in postCart .....................: $e");
      return null;
    }
  }

  Future<CartModel> deleteFromCart(int id) async {
  try {
    final res = await Api().dio.delete(
      'api/v1/carts/items/$id',
    );

    print("API Response: ${res.data}");
    return CartModel.fromJson(res.data);
  } on DioException catch (e) {
    print("Delete cart error: ${e.response?.data}");
    rethrow; 
  }
}

}
