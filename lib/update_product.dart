import 'dart:math';

import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/products_model.dart';
import 'package:store_app/services/update_product.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_text_field.dart';

class UpdateProductView extends StatefulWidget {
  UpdateProductView({super.key});
  static const route = "updateProductView";

  @override
  State<UpdateProductView> createState() => _UpdateProductViewState();
}

class _UpdateProductViewState extends State<UpdateProductView> {
  String? productName, desc, image;

  String? price;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    ProductsModel product =
        ModalRoute.of(context)!.settings.arguments as ProductsModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Update Product"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 120,
                ),
                CustomTextField(
                    onChanged: (data) {
                      productName = data;
                    },
                    hintText: product.title),
                SizedBox(
                  height: 15,
                ),
                CustomTextField(
                    inputType: TextInputType.number,
                    onChanged: (data) {
                      price = data;
                    },
                    hintText: product.price.toString()),
                SizedBox(
                  height: 15,
                ),
                CustomTextField(
                    onChanged: (data) {
                      desc = data;
                    },
                    hintText:product.description),
                SizedBox(
                  height: 15,
                ),
                CustomTextField(
                    onChanged: (data) {
                      image = data;
                    },
                    hintText: "New Image"),
                SizedBox(
                  height: 25,
                ),
                CustomButton(
                    onTap: () async {
                      isLoading = true;
                      setState(() {});
                      try {
                        await updateProduct(product);
                        print("Success");
                      } on Exception catch (e) {
                        print(e.toString());
                      }
                      isLoading = false;
                      setState(() {});
                      Navigator.pop(context);
                    },
                    buttonText: "Update")
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductsModel product) async {
    await UpdateProduct().updateProduct(
        id: product.id.toString(),
        title: productName == null ? product.title : productName!,
        price: price == null ? product.price.toString() : price!,
        description: desc == null ? product.description : desc!,
        image: image == null ? product.image : image!,
        category: product.category);
  }
}
