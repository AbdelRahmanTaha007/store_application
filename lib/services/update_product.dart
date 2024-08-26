import 'package:store_app/helper/api.dart';
import 'package:store_app/models/products_model.dart';

class UpdateProduct {
  Future<ProductsModel> updateProduct({
    required String title,
    required String price,
    required String description,
    required String image,
    required String category,
    required String id,
  }) async {
    print("Product id = $id");
    Map<String, dynamic> data =
        await Api().put(url:"https://fakestoreapi.com/products/$id",
        body: {
      "title": title,
      "price": price,
      "description": description,
      "image": image,
      "category": category
    });
    return ProductsModel.fromJson(data);
  }
}
