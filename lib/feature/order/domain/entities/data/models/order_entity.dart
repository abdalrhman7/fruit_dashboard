import 'package:fruit_dashboard/core/enums/order_enum.dart';

import 'order_product_entity.dart';
import 'shipping_address_entity.dart';

class OrderEntity {
  final double totalPrice;
  final String orderId;
  final String uId;
  final ShippingAddressEntity shippingAddressEntity;
  final List<OrderProductEntity> orderProducts;
  final String paymentMethod;
  final OrderStatus status;

  OrderEntity(
      {required this.totalPrice,
      required this.uId,
        required this.orderId,
      required this.shippingAddressEntity,
      required this.orderProducts,
      required this.paymentMethod,
      required this.status
      });
}

// payment method
