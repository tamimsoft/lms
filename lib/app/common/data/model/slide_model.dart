import 'package:lms/app/common/data/entity/base_entity.dart';

class Slide extends BaseEntity<Slide> {
  final String id;
  final String bookId;

  Slide({
    this.id = '',
    this.bookId = '',
  });

  @override
  Slide fromJson({required Map<String, dynamic> json}) {
    return Slide(
      id: json['id'],
      bookId: json['book_id']
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'book_id': bookId,
    };
  }
}
