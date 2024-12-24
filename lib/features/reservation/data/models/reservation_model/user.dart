class User {
  int? id;
  String? name;
  String? phone;
  String? verificationCode;
  String? email;
  String? avatar;
  int? balance;
  String? lat;
  String? long;
  String? location;
  String? createdAt;
  String? createdAtFormatted;

  User({
    this.id,
    this.name,
    this.phone,
    this.verificationCode,
    this.email,
    this.avatar,
    this.balance,
    this.lat,
    this.long,
    this.location,
    this.createdAt,
    this.createdAtFormatted,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'] as int?,
        name: json['name'] as String?,
        phone: json['phone'] as String?,
        verificationCode: json['verification_code'] as String?,
        email: json['email'] as String?,
        avatar: json['avatar'] as String?,
        balance: json['balance'] as int?,
        lat: json['lat'] as String?,
        long: json['long'] as String?,
        location: json['location'] as String?,
        createdAt: json['created_at'] as String?,
        createdAtFormatted: json['created_at_formatted'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'phone': phone,
        'verification_code': verificationCode,
        'email': email,
        'avatar': avatar,
        'balance': balance,
        'lat': lat,
        'long': long,
        'location': location,
        'created_at': createdAt,
        'created_at_formatted': createdAtFormatted,
      };
}
