import 'package:lms/app/common/data/base_model.dart';

class BookModel implements BaseModel<BookModel> {
  int id;
  String title;
  String author;

  BookModel({this.id = 0, this.title = '', this.author = ''});

  @override
  BookModel fromJson({required Map<String, dynamic> json}) {
    return BookModel(
      id: json['id'] as int,
      title: json['title'] as String,
      author: json['author'] as String,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {'id': id, 'title': title, 'author': author};
  }

}
