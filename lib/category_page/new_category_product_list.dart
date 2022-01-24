import 'package:category_product_list/category_page/category_product_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewCategoryProductPage extends StatelessWidget {
  final CategoryProductController _categoryProductController =
      Get.put(CategoryProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("new category page"),
      ),
      body: Center(
        child: Obx(
          () => ListView.builder(
            itemCount: _categoryProductController
                    .updatedCategoryListApi.value.data?.length ??
                0,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Image.network(_categoryProductController
                    .updatedCategoryListApi.value.data![index].image ??
                    ""),
                title: Text(_categoryProductController
                    .updatedCategoryListApi.value.data![index].categoryName ??
                    'no category'),
                subtitle: Text(_categoryProductController
                    .updatedCategoryListApi.value.data![index].id
                        .toString() ??
                    'no Id'),
              );
            },
          ),
        ),
      ),
    );
  }
}
