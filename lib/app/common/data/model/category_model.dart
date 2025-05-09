import 'package:lms/app/common/data/entity/base_entity.dart';

class Category implements BaseEntity<Category> {
  String id;
  String name;

  Category({this.id = '', this.name = ''});

  @override
  Category fromJson({required Map<String, dynamic> json}) {
    return Category(id: json['id'], name: json['name']);
  }

  @override
  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name};
  }
}
