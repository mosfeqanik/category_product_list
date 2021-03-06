import 'package:category_product_list/category_page/new_category_product_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'category_product_page_controller.dart';

class CategoryProductPage extends StatelessWidget {
  final CategoryProductController _categoryProductController =
  Get.put(CategoryProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_categoryProductController.appName.toString()),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(NewCategoryProductPage());
              },
              icon: Icon(Icons.account_balance_outlined))
        ],
      ),
      body: Center(
        child: Obx(
              () => ListView.builder(
            itemCount: _categoryProductController.updatedCategoryProductListAPI.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Image.network(_categoryProductController.updatedCategoryProductListAPI[index].image??""),
                title: Text(_categoryProductController.updatedCategoryProductListAPI[index].categoryName??'no category'),
                subtitle: Text(_categoryProductController.updatedCategoryProductListAPI[index].id.toString()??'no Id'),
              );
            },
          ),
        ),
      ),
    );
  }
}
