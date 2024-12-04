import 'package:fetch_five/app/services/dio_client.dart';
import 'package:get/get.dart';

class ServicesBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<DioClient>(DioClient());
  }
}
