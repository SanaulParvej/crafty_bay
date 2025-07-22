import 'package:crafty_bay/core/services/network/network_client.dart';
import 'package:crafty_bay/features/auth/ui/controller/main_bottom_nav_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(MainBottomNavController());
    Get.put(
      NetworkClient(
          onUnAuthorize: _onUnAuthorize, commonHeaders: _commonHeaders),
    );
  }

  void _onUnAuthorize() {
    //TODO: LOGOUT FROM APP
  }
  final Map<String, String> _commonHeaders = {
    'content-type': 'application/json',
    'token': ''
  };
}
