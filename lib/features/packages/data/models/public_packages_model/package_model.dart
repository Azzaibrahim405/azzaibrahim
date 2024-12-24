class PackageModel {
  int? id;
  int? price;
  int? balance;

  PackageModel({this.id, this.price, this.balance});

  factory PackageModel.fromJson(Map<String, dynamic> json) => PackageModel(
        id: json['id'] as int?,
        price: json['price'] as int?,
        balance: json['balance'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'price': price,
        'balance': balance,
      };
}
