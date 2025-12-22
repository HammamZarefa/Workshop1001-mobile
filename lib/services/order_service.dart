import 'package:coda_workshop/api/api.dart';
import 'package:coda_workshop/models/cart_model.dart';
import 'package:coda_workshop/models/order_model.dart';

class OrderService {
  Future<OrderModel?> postOrder(
      String shippingAddress, String currency, List<Items> items) async {
    try {
      final itemList = items.map((item) => {
            'product_id': item.product?.id,
            'price': double.tryParse(item.price ?? "0") ?? 0,
            'quantity': int.tryParse(item.quantity ?? "1") ?? 1,
            'note': '', 
          }).toList();

      var res = await Api().dio.post('api/v1/orders', data: {
        'shipping_address': shippingAddress,
        'currency': currency,
        'items': itemList,
      });

      return OrderModel.fromJson(res.data);
    } catch (e) {
      print("Error in postOrder: $e");
      return null;
    }
  }
}
