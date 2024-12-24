import 'addition.dart';
import 'service.dart';
import 'size.dart';
import 'user.dart';
import 'washer.dart';

class Order {
  int? id;
  String? status;
  int? servicePrice;
  int? additionTotalPrice;
  int? subTotal;
  int? tax;
  int? total;
  int? serviceDiscount;
  bool? hasServiceDiscount;
  int? couponDiscount;
  bool? hasCouponDiscount;
  String? createdAt;
  String? updatedAt;
  String? createdAtFormatted;
  String? updatedAtFormatted;
  List<dynamic>? payments;
  User? user;
  Washer? washer;
  Service? service;
  dynamic coupon;
  Size? size;
  List<Addition>? additions;
  List<dynamic>? taxes;
  dynamic reason;
  bool? hasValidPackage;
  bool? paidByReward;
  bool? paidByPackage;

  Order({
    this.id,
    this.status,
    this.servicePrice,
    this.additionTotalPrice,
    this.subTotal,
    this.tax,
    this.total,
    this.serviceDiscount,
    this.hasServiceDiscount,
    this.couponDiscount,
    this.hasCouponDiscount,
    this.createdAt,
    this.updatedAt,
    this.createdAtFormatted,
    this.updatedAtFormatted,
    this.payments,
    this.user,
    this.washer,
    this.service,
    this.coupon,
    this.size,
    this.additions,
    this.taxes,
    this.reason,
    this.hasValidPackage,
    this.paidByReward,
    this.paidByPackage,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json['id'] as int?,
        status: json['status'] as String?,
        servicePrice: json['servicePrice'] as int?,
        additionTotalPrice: json['additionTotalPrice'] as int?,
        subTotal: json['subTotal'] as int?,
        tax: json['tax'] as int?,
        total: json['total'] as int?,
        serviceDiscount: json['serviceDiscount'] as int?,
        hasServiceDiscount: json['hasServiceDiscount'] as bool?,
        couponDiscount: json['couponDiscount'] as int?,
        hasCouponDiscount: json['hasCouponDiscount'] as bool?,
        createdAt: json['createdAt'] as String?,
        updatedAt: json['updatedAt'] as String?,
        createdAtFormatted: json['createdAtFormatted'] as String?,
        updatedAtFormatted: json['updatedAtFormatted'] as String?,
        payments: json['payments'] as List<dynamic>?,
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
        washer: json['washer'] == null
            ? null
            : Washer.fromJson(json['washer'] as Map<String, dynamic>),
        service: json['service'] == null
            ? null
            : Service.fromJson(json['service'] as Map<String, dynamic>),
        coupon: json['coupon'] as dynamic,
        size: json['size'] == null
            ? null
            : Size.fromJson(json['size'] as Map<String, dynamic>),
        additions: (json['additions'] as List<dynamic>?)
            ?.map((e) => Addition.fromJson(e as Map<String, dynamic>))
            .toList(),
        taxes: json['taxes'] as List<dynamic>?,
        reason: json['reason'] as dynamic,
        hasValidPackage: json['hasValidPackage'] as bool?,
        paidByReward: json['paidByReward'] as bool?,
        paidByPackage: json['paidByPackage'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'status': status,
        'servicePrice': servicePrice,
        'additionTotalPrice': additionTotalPrice,
        'subTotal': subTotal,
        'tax': tax,
        'total': total,
        'serviceDiscount': serviceDiscount,
        'hasServiceDiscount': hasServiceDiscount,
        'couponDiscount': couponDiscount,
        'hasCouponDiscount': hasCouponDiscount,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'createdAtFormatted': createdAtFormatted,
        'updatedAtFormatted': updatedAtFormatted,
        'payments': payments,
        'user': user?.toJson(),
        'washer': washer?.toJson(),
        'service': service?.toJson(),
        'coupon': coupon,
        'size': size?.toJson(),
        'additions': additions?.map((e) => e.toJson()).toList(),
        'taxes': taxes,
        'reason': reason,
        'hasValidPackage': hasValidPackage,
        'paidByReward': paidByReward,
        'paidByPackage': paidByPackage,
      };
}
