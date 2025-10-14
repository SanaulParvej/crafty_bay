import 'package:crafty_bay/features/auth/ui/controller/main_bottom_nav_controller.dart';
import 'package:crafty_bay/features/cart/ui/screens/cart_screen.dart';
import 'package:crafty_bay/features/common/controllers/category_list_controller.dart';
import 'package:crafty_bay/features/home/ui/controllers/new_product_list_controller.dart';
import 'package:crafty_bay/features/home/ui/controllers/popular_product_list_controller.dart';
import 'package:crafty_bay/features/home/ui/controllers/special_product_list_controller.dart';
import 'package:crafty_bay/features/home/ui/screens/home_screen.dart';
import 'package:crafty_bay/features/product/ui/screens/product_category_screen.dart';
import 'package:crafty_bay/features/wish_list/ui/screen/wish_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../home/ui/controllers/home_slider_controller.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  static final String name = '/main-bottom-nav';

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  final List<Widget> _screens = [
    HomeScreen(),
    ProductCategoryScreen(),
    CartScreen(),
    WishListScreen(),
  ];

  @override
  void initState() {
    super.initState();
    print('Initializing MainBottomNavScreen...');
    WidgetsBinding.instance.addPostFrameCallback((_) {
      print('Fetching data in MainBottomNavScreen...');
      Get.find<HomeSliderController>().getHomeSliders();
      Get.find<CategoryListController>().getCategoryList();
      Get.find<PopularProductController>().getPopularProducts();
      Get.find<SpecialProductController>().getSpecialProducts();
      Get.find<NewProductController>().getNewProducts();
      print('Data fetching initiated');
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainBottomNavController>(builder: (navController) {
      return Scaffold(
        body: _screens[navController.selectedIndex],
        bottomNavigationBar: NavigationBar(
            selectedIndex: navController.selectedIndex,
            onDestinationSelected: navController.changeIndex,
            destinations: [
              NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
              NavigationDestination(
                  icon: Icon(Icons.category_outlined), label: 'Category'),
              NavigationDestination(
                  icon: Icon(Icons.shopping_cart), label: 'Cart'),
              NavigationDestination(
                  icon: Icon(Icons.favorite_outline_rounded),
                  label: 'Wishlist'),
            ]),
      );
    });
  }
}
