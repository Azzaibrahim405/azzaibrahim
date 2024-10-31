import 'service_item.dart';
import 'links.dart';
import 'meta.dart';

class Services {
  List<ServiceItemModel>? serviceItem;
  Links? links;
  Meta? meta;

  Services({this.serviceItem, this.links, this.meta});

  factory Services.fromJson(Map<String, dynamic> json) => Services(
        serviceItem: (json['data'] as List<dynamic>?)
            ?.map((e) => ServiceItemModel.fromJson(e as Map<String, dynamic>))
            .toList(),
        links: json['links'] == null
            ? null
            : Links.fromJson(json['links'] as Map<String, dynamic>),
        meta: json['meta'] == null
            ? null
            : Meta.fromJson(json['meta'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'data': serviceItem?.map((e) => e.toJson()).toList(),
        'links': links?.toJson(),
        'meta': meta?.toJson(),
      };
}
