import 'package:store_app/helper/api.dart';
import 'package:store_app/models/products_model.dart';


class AllCategoriesService {
  Future<List<dynamic>> getAllCategories() async{
    List<dynamic> data =await Api().get(url: "https://fakestoreapi.com/products");
    return data;
  }
  
}

/**
 * Old request
 * 
 *  http.Response response = await http.get(Uri.parse(
//         "https://fakestoreapi.com/products/categories")); //Get Request.
//     if (response.statusCode == 200) {
//   List<dynamic> data = jsonDecode(response.body); // Decodes the Response.
//   return data;
// }else
// {
//   return throw Exception(" There is Problem with the Status code ${response.statusCode}");
// }
//   
 */