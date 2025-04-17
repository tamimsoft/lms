import 'package:lms/app/common/data/base_model.dart';

class CategoryModel implements BaseModel<CategoryModel> {
  int id;
  String name;

  CategoryModel({this.id = 0, this.name = ''});

  @override
  CategoryModel fromJson({required Map<String, dynamic> json}) {
    return CategoryModel(id: json['id'] as int, name: json['name'] as String);
  }

  @override
  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name};
  }
}
