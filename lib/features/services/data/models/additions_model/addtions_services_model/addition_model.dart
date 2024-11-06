class AdditionModel {
  int? id;
  String? name;
  int? price;
  bool? isFree;
  String? image;

  AdditionModel({this.id, this.name, this.price, this.isFree, this.image,});

  factory AdditionModel.fromJson(Map<String, dynamic> json) => AdditionModel(
        id: json['id'] as int?,
        name: json['name'] as String?,
        price: json['price'] as int?,
        isFree: json['isFree'] as bool?,
        image: json['image'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'price': price,
        'isFree': isFree,
        'image': image,
      };
}
