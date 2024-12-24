import 'package_model.dart';
import 'links.dart';
import 'meta.dart';

class Data {
  List<PackageModel>? packages;
  Links? links;
  Meta? meta;

  Data({this.packages, this.links, this.meta});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        packages: (json['data'] as List<dynamic>?)
            ?.map((e) => PackageModel.fromJson(e as Map<String, dynamic>))
            .toList(),
        links: json['links'] == null
            ? null
            : Links.fromJson(json['links'] as Map<String, dynamic>),
        meta: json['meta'] == null
            ? null
            : Meta.fromJson(json['meta'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'data': packages?.map((e) => e.toJson()).toList(),
        'links': links?.toJson(),
        'meta': meta?.toJson(),
      };
}
