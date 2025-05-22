import 'package:lms/app/common/data/entity/base_entity.dart';

class Tag extends BaseEntity<Tag> {
  String? id;
  String? name;
  String? slug;

  Tag({this.id, this.name, this.slug});

  @override
  Tag fromJson({required Map<String, dynamic> json}) {
    return Tag(
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
