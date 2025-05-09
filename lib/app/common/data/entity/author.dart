import 'base_entity.dart';

class Author implements BaseEntity<Author> {
  String? id;
  String? name;
  String? slug;

  Author({this.id, this.name, this.slug});

  @override
  Author fromJson({required Map<String, dynamic> json}) {
    return Author(
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
