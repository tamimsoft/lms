import 'base_entity.dart';

class Publication implements BaseEntity<Publication> {
  String? id;
  String? name;
  String? slug;

  Publication({this.id, this.name, this.slug});

  @override
  Publication fromJson({required Map<String, dynamic> json}) {
    return Publication(
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
