class Notification {
  String? id;
  String? name;
  String? slug;

  Notification({this.id, this.name, this.slug});

  factory Notification.fromJson({required Map<String, dynamic> json}) {
    return Notification(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'slug': slug};
  }
}
