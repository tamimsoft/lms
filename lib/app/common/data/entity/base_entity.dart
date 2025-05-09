abstract class BaseEntity<T> {
  T fromJson({required Map<String, dynamic> json});

  Map<String, dynamic> toJson();
}
