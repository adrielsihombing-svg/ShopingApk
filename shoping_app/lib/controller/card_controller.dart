import 'package:get/state_manager.dart';
import 'package:shoping_app/models/product.dart';

class cardController extends GetxController{
  var cardItems = <Product>[].obs;
  int get count => cardItems.length;
  double get totalAmount => cardItems.fold(0, (sum, items) => sum + items.price);

  addItems(Product product){
      cardItems.add(product);
  }
}