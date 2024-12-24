class Washer {
  int? id;
  String? name;
  String? image;
  String? description;
  String? address;
  int? rate;
  int? distance;
  bool? hasPackage;
  dynamic isFollowed;

  Washer({
    this.id,
    this.name,
    this.image,
    this.description,
    this.address,
    this.rate,
    this.distance,
    this.hasPackage,
    this.isFollowed,
  });

  factory Washer.fromJson(Map<String, dynamic> json) => Washer(
        id: json['id'] as int?,
        name: json['name'] as String?,
        image: json['image'] as String?,
        description: json['description'] as String?,
        address: json['address'] as String?,
        rate: json['rate'] as int?,
        distance: json['distance'] as int?,
        hasPackage: json['has_package'] as bool?,
        isFollowed: json['is_followed'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
        'description': description,
        'address': address,
        'rate': rate,
        'distance': distance,
        'has_package': hasPackage,
        'is_followed': isFollowed,
      };
}
