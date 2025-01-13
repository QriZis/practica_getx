import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:tutorial/theming_and_state_management/domain/model/product.dart';
import 'package:tutorial/theming_and_state_management/domain/repository/api_repository.dart';

class ProductsController extends GetxController{

  final ApiRepositoryInterface apiRepositoryInterface;

  ProductsController({required this.apiRepositoryInterface});


  RxList<Product> productList = <Product>[].obs;

  @override
  void onInit() {
    loadProducts();
    super.onInit();
  }


void loadProducts() async {
  final result = await apiRepositoryInterface.getProducts();
  productList.value = result;
}

}