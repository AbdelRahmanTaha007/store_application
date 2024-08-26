import 'package:store_app/helper/api.dart';
import 'package:store_app/models/products_model.dart';

class AllProductsService {
  Future<List<ProductsModel>> getAllProducts() async {
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products');

    List<ProductsModel> productsList = [];
    for (int i = 0; i < data.length; i++) {
      productsList.add(
        ProductsModel.fromJson(data[i]),
      );
    }
    return productsList;
  }
}





/**
 * Old request
 *  // http.Response response =
    //     await http.get(Uri.parse("https://fakestoreapi.com/products")); //Get Request.
    // if (response.statusCode == 200) {
    //   List<dynamic> data = jsonDecode(response.body); // Decodes the Response.
    //   List<ProductsModel> productsList = []; //The list that will Carry the data
    //   for (var i = 0; i < data.length; i++) {
    //     // For Loop that decodes the data from $data and store it in $productsList
    //     productsList.add(ProductsModel.fromJson(data[i]));
    //   }
    //   return productsList;
    // } else {
    //   return throw Exception(
    //       " There is Problem with the Status code ${response.statusCode}");
    // }
 */