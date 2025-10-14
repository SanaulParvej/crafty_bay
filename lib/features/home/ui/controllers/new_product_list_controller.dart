import 'package:crafty_bay/features/common/models/product_model.dart';
import 'package:get/get.dart';
import '../../../../app/urls.dart';
import '../../../../core/services/network/network_client.dart';

class NewProductController extends GetxController {
  bool _inProgress = false;
  String? _errorMessage;

  bool get inProgress => _inProgress;
  String? get errorMessage => _errorMessage;

  List<ProductModel> _productModelList = [];
  List<ProductModel> get productModelList => _productModelList;

  Future<bool> getNewProducts() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    print('Fetching new products...');

    // Use category ID for "New Arrival" instead of tag
    final String newArrivalCategoryId = '67c7bec4623a876bc4766fea';
    print(
        'New products URL: ${Urls.productListByCategoryUrl(10, 1, newArrivalCategoryId)}');
    final NetworkResponse response = await Get.find<NetworkClient>()
        .getRequest(Urls.productListByCategoryUrl(10, 1, newArrivalCategoryId));

    print('New products response received. Success: ${response.isSuccess}');
    if (response.isSuccess) {
      print('New Products Response Data: ${response.responseData}');

      if (response.responseData != null &&
          response.responseData!['data'] != null) {
        print('Data field exists');

        if (response.responseData!['data']['results'] != null) {
          print('Results field exists');
          print(
              'Results length: ${response.responseData!['data']['results'].length}');

          List<ProductModel> list = [];
          final results = response.responseData!['data']['results'] as List;
          print('Processing ${results.length} products');

          for (int i = 0; i < results.length; i++) {
            final item = results[i];
            print(
                'Processing product $i: ${item is Map ? item['_id'] : 'Unknown type'}');
            try {
              if (item is Map<String, dynamic>) {
                final product = ProductModel.fromJson(item);
                print(
                    'Successfully created ProductModel for product $i: ${product.title}');
                list.add(product);
              } else {
                print(
                    'Product $i is not a Map<String, dynamic>: ${item.runtimeType}');
              }
            } catch (e, stackTrace) {
              print('Error creating ProductModel for product $i: $e');
              print('Stack trace: $stackTrace');
              print('Item data: $item');
            }
          }
          print('Successfully processed ${list.length} products');
          _productModelList = list;
          isSuccess = true;
          _errorMessage = null;
        } else {
          print('Results field does not exist');
          _errorMessage = 'No results field in response';
        }
      } else {
        print('Data field does not exist');
        _errorMessage = 'No data field in response';
      }
    } else {
      _errorMessage = response.errorMessage!;
      print('API Error: ${response.errorMessage}');
    }
    _inProgress = false;
    print(
        'New products fetch completed. Success: $isSuccess, Product count: ${_productModelList.length}');
    update();

    return isSuccess;
  }
}
