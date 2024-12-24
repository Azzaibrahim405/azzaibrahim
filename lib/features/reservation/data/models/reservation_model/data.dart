import 'order_item.dart';
import 'links.dart';
import 'meta.dart';

class Data {
  List<OrderItem>? ordersList;
  Links? links;
  Meta? meta;

  Data({this.ordersList, this.links, this.meta});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        ordersList: (json['data'] as List<dynamic>?)
            ?.map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
            .toList(),
        links: json['links'] == null
            ? null
            : Links.fromJson(json['links'] as Map<String, dynamic>),
        meta: json['meta'] == null
            ? null
            : Meta.fromJson(json['meta'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'data': ordersList?.map((e) => e.toJson()).toList(),
        'links': links?.toJson(),
        'meta': meta?.toJson(),
      };
}
