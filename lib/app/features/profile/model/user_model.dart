class UserModel {
  final String id;
  final String email;
  final String? fullName;
  final String? phone;

  UserModel({
    required this.id,
    required this.email,
    this.fullName,
    this.phone,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      email: map['email'],
      fullName: map['full_name'],
      phone: map['phone'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'full_name': fullName,
      'phone': phone,
    };
  }
}