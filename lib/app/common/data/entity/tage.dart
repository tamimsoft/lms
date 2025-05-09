import 'package:lms/app/common/data/entity/base_entity.dart';

class Tage extends BaseEntity<Tage> {
  String? id;
  String? name;
  String? slug;

  Tage({this.id, this.name, this.slug});

  @override
  Tage fromJson({required Map<String, dynamic> json}) {
    return Tage(
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
