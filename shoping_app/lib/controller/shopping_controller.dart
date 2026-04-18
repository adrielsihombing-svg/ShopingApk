import 'package:get/state_manager.dart';
import 'package:shoping_app/models/product.dart';

class ShoppingController extends GetxController{
  var product = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async{
     await Future.delayed(Duration(seconds: 1));
     var prodactresult = [
        Product(
            id: '1',
            name: 'Product 1',
            description: 'Description of Product 1',
            price: 19.99,
            imageUrl: null,
        ),
        Product(
            id: '2',
            name: 'Product 2',
            description: 'Description of Product 2',
            price: 29.99,
            imageUrl: null,
        ),
        Product(
            id: '3',
            name: 'Product 3',
            description: 'Description of Product 3',
            price: 39.99,
            imageUrl: null,
        ),
     ];

     product.value = prodactresult;
  }
}