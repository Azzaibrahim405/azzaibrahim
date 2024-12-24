class Addition {
  int? id;
  String? name;
  int? quantity;
  int? price;
  String? image;

  Addition({this.id, this.name, this.quantity, this.price, this.image});

  factory Addition.fromJson(Map<String, dynamic> json) => Addition(
        id: json['id'] as int?,
        name: json['name'] as String?,
        quantity: json['quantity'] as int?,
        price: json['price'] as int?,
        image: json['image'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'quantity': quantity,
        'price': price,
        'image': image,
      };
}
