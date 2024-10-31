class CarData {
  int? id;
  String? name;
  String? description;
  String? image;
  bool? hasPackage;

  CarData({
    this.id,
    this.name,
    this.description,
    this.image,
    this.hasPackage,
  });

  factory CarData.fromJson(Map<String, dynamic> json) => CarData(
        id: json['id'] as int?,
        name: json['name'] as String?,
        description: json['description'] as String?,
        image: json['image'] as String?,
        hasPackage: json['has_package'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'image': image,
        'has_package': hasPackage,
      };
}
