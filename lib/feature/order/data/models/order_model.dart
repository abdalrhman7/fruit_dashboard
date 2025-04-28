import 'package:fruit_dashboard/core/enums/order_enum.dart';
import 'package:fruit_dashboard/feature/order/data/models/shipping_address_model.dart';

import '../../domain/entities/data/models/order_entity.dart';
import 'order_product_model.dart';

class OrderModel {
  final double totalPrice;
  final String uId;
  final ShippingAddressModel shippingAddressModel;
  final List<OrderProductModel> orderProducts;
  final String paymentMethod;
  final String? status;
  final String orderId;

  OrderModel({
    required this.totalPrice,
    required this.uId,
    required this.shippingAddressModel,
    required this.orderProducts,
    required this.status,
    required this.paymentMethod,
    required this.orderId,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        totalPrice: json['totalPrice'],
        uId: json['uId'],
        shippingAddressModel:
            ShippingAddressModel.fromJson(json['shippingAddressModel']),
        orderProducts: List<OrderProductModel>.from(
          json['orderProducts'].map((e) => OrderProductModel.fromJson(e)),
        ),
        paymentMethod: json['paymentMethod'],
        status: json['status'],
    orderId: json['orderId'],
      );

  toJson() => {
        'totalPrice': totalPrice,
        'uId': uId,
        'status': status,
        'date': DateTime.now().toString(),
        'shippingAddressModel': shippingAddressModel.toJson(),
        'orderProducts': orderProducts.map((e) => e.toJson()).toList(),
        'paymentMethod': paymentMethod,
      };

  toEntity() => OrderEntity(
        totalPrice: totalPrice,
        uId: uId,
        status: status != null
            ? OrderStatus.values.firstWhere((element) => element.name == status)
            : OrderStatus.pending,
        shippingAddressEntity: shippingAddressModel.toEntity(),
        orderProducts: orderProducts.map((e) => e.toEntity()).toList(),
        paymentMethod: paymentMethod,
        orderId: orderId,
      );
}

// payment method
