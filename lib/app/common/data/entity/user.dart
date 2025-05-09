import 'package:lms/app/common/data/entity/base_entity.dart';

class User extends BaseEntity<User> {
  String? id;
  String? userName;
  String? firstName;
  String? lastName;
  String? mobile;
  String? avatarUrl;
  String? address;
  String? bio;
  String? favoriteBookIds;
  String? createdAt;

  User({
    this.id,
    this.userName,
    this.firstName,
    this.lastName,
    this.mobile,
    this.avatarUrl,
    this.address,
    this.bio,
    this.favoriteBookIds,
    this.createdAt,
  });

  @override
  User fromJson({required Map<String, dynamic> json}) {
    return User(
      id: json['id'],
      userName: json['user_name'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      mobile: json['mobile'],
      avatarUrl: json['avatar_url'],
      address: json['address'],
      bio: json['bio'],
      favoriteBookIds: json['favorite_book_ids'],
      createdAt: json['created_at'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_name': userName,
      'first_name': firstName,
      'last_name': lastName,
      'mobile': mobile,
      'avatar_url': avatarUrl,
      'address': address,
      'bio': bio,
      'favorite_book_ids': favoriteBookIds,
      'created_at': createdAt,
    };
  }
}
