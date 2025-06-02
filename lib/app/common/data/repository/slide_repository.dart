import 'package:lms/app/common/data/model/slide.dart';
import 'package:lms/app/core/services/database/app_db.dart';

class SlideRepository {
  final AppDb _db;

  SlideRepository(this._db);

  Future<List<Slide>> getSlides() async {
    return await _db.callRpc(
      functionName: 'get_slides',
      fromJson: (json) => Slide.fromJson(json),
      toJson: (s) => s.toJson(),
    );
  }
}
