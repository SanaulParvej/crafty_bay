import 'package:crafty_bay/core/services/network/network_client.dart';
import 'package:crafty_bay/features/auth/ui/controller/login_controller.dart';
import 'package:crafty_bay/features/auth/ui/controller/main_bottom_nav_controller.dart';
import 'package:crafty_bay/features/auth/ui/controller/sign_up_controller.dart';
import 'package:crafty_bay/features/auth/ui/controller/verify_otp_controller.dart';
import 'package:crafty_bay/features/auth/ui/screens/login_screen.dart';
import 'package:crafty_bay/features/cart/ui/controllers/cart_list_controller.dart';
import 'package:crafty_bay/features/common/controllers/auth_controller.dart';
import 'package:crafty_bay/features/common/controllers/category_list_controller.dart';
import 'package:crafty_bay/features/home/ui/controllers/home_slider_controller.dart';
import 'package:crafty_bay/features/home/ui/controllers/new_product_list_controller.dart';
import 'package:crafty_bay/features/home/ui/controllers/popular_product_list_controller.dart';
import 'package:crafty_bay/features/home/ui/controllers/special_product_list_controller.dart';
import 'package:get/get.dart';
import '../features/product/controllers/add_to_cart_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    print('Initializing controllers...');
    Get.put(AuthController());
    Get.put(MainBottomNavController());
    Get.put(
      NetworkClient(
        onUnAuthorize: _onUnAuthorize,
        commonHeaders: () {
          return _commonHeaders();
        },
      ),
    );
    Get.put(SignUpController());
    Get.put(VerifyOtpController());
    Get.put(LoginController());
    Get.put(HomeSliderController());
    Get.put(CategoryListController());
    Get.put(PopularProductController());
    Get.put(SpecialProductController());
    Get.put(NewProductController());
    Get.put(AddToCartController());
    Get.put(CartListController());
    print('Controllers initialized successfully');
  }

  Future<void> _onUnAuthorize() async {
    await Get.find<AuthController>().clearUserData();
    Get.to(() => LoginScreen());
  }

  Map<String, String> _commonHeaders() {
    return {
      'content-type': 'application/json',
      'token': Get.find<AuthController>().accessToken ?? '',
    };
  }
}
