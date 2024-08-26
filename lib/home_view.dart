import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/models/products_model.dart';
import 'package:store_app/services/get_all_products_service.dart';
import 'package:store_app/widgets/custom_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static String route = "homeView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.all(10),
            child: IconButton(
              onPressed: () {},
              icon: Icon(FontAwesomeIcons.cartPlus),
            ),
          )
        ],
        centerTitle: true,
        title: Text(
          "New Trend",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
      body: FutureBuilder<List<ProductsModel>>(
        future: AllProductsService().getAllProducts(),
        builder: (context, snapshot) {
          print(snapshot.data);
          if (snapshot.hasData) {
            List<ProductsModel> products = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
              child: GridView.builder(
                clipBehavior: Clip.none,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.9,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 25),
                itemCount: products.length,
                itemBuilder: (BuildContext context, int index) {
                  return CustomCard(
                    product: products[index],
                  );
                },
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
