import 'package:lms/app/common/data/entity/base_entity.dart';

class Category implements BaseEntity<Category> {
  String? id;
  String? name;
  String? slug;

  Category({this.id, this.name, this.slug});

  @override
  Category fromJson({required Map<String, dynamic> json}) {
    return Category(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'slug': slug};
  }
}
