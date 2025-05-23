import 'package:get/get.dart';
import 'package:lms/app/common/service/connectivity_service.dart';
import 'package:lms/app/core/services/database/app_db.dart';
import 'package:lms/app/core/services/database/hybrid_db_impl.dart';
import 'package:lms/app/features/auth/controller/auth_controller.dart';
import 'package:lms/app/features/auth/service/auth_service.dart';

class GlobalBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ConnectivityService>(ConnectivityService(), permanent: true);
    Get.put<AppDb>(HybridDbImpl(), permanent: true);

    /// services
    Get.put<AuthService>(AuthService(), permanent: true);

    /// controllers
    Get.put<AuthController>(AuthController(), permanent: true);
  }
}
