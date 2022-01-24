import 'package:category_product_list/category_page/model/data.dart';
import 'package:category_product_list/category_page/model/category_product_model.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class CategoryProductController extends GetxController{

  var appName = ''.obs;
  var updatedCategoryProductListAPI = <Data>[].obs;
  RxObjectMixin<CategoryProductModel> updatedCategoryListApi =
      CategoryProductModel().obs;

  @override
  void onInit() {
    appName.value = 'Catergory';
    // TODO: implement onInit
    // _getDataCategoryProductGavityInfoTechAPI();
    _getDataCategoryProductGavityInfoTechAPIUsingRxObjectMixin();
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void _getDataCategoryProductGavityInfoTechAPI() async{
    Dio _dio = Dio();
    var myUrl = 'https://gravityinfotech.net/project/food-v6/api/category';
    var connectivityResult = await (Connectivity().checkConnectivity());

    try {
      if (connectivityResult == ConnectivityResult.none) {
        print('No Internet Connection');
        Get.snackbar('Ops!', 'No Internet Connection');
      } else {
        EasyLoading.show(status: 'loading...');
        var response1 = await _dio.get(myUrl);

        print('HTTP Request: URL $myUrl');
        print('HTTP Request: Status Code ${response1.statusCode}');

        if (response1.statusCode == 200) {
          var restfulAPIData = response1.data['data'] as List;

          var myReceivedListForAPI =
          restfulAPIData.map((e) => Data.fromJson(e)).toList();

          print(
              'HTTP Request: Before Insert Data ${updatedCategoryProductListAPI.length} ');
          updatedCategoryProductListAPI.addAll(myReceivedListForAPI);
          print(
              'HTTP Request: after Insert Data ${updatedCategoryProductListAPI.length} ');
          print('HTTP Request length Data ${updatedCategoryProductListAPI.length} ');
          // loadingStatus.value = false;
          EasyLoading.dismiss();
        } else {
          print('Data not found ');
          // loadingStatus.value = false;
        }
      }
    } catch (e, l) {
      print(runtimeType);
      print(e);
      print(l);
      // loadingStatus.value = false;
    }
  }

  void _getDataCategoryProductGavityInfoTechAPIUsingRxObjectMixin() async{
    Dio _dio = Dio();
    var myUrl = 'https://gravityinfotech.net/project/food-v6/api/category';
    var connectivityResult = await (Connectivity().checkConnectivity());
    try {
      if (connectivityResult == ConnectivityResult.none) {
        print('No Internet Connection');
        Get.snackbar('Ops!', 'No Internet Connection');
      } else {
        EasyLoading.show(status: 'loading...');
        var response1 = await _dio.get(myUrl);

        print('HTTP Request: URL $myUrl');
        print('HTTP Request: Status Code ${response1.statusCode}');

        if (response1.statusCode == 200) {
          var restfulAPIData = response1.data;

          updatedCategoryListApi.value = CategoryProductModel.fromJson(restfulAPIData);

          // print(
          //     'HTTP Request: Before Insert Data ${updatedCategoryProductListAPI.length} ');
          // updatedCategoryProductListAPI.addAll(myReceivedListForAPI);
          // print(
          //     'HTTP Request: after Insert Data ${updatedCategoryProductListAPI.length} ');
          // print('HTTP Request length Data ${updatedCategoryProductListAPI.length} ');
          // loadingStatus.value = false;
          EasyLoading.dismiss();
        } else {
          print('Data not found ');
          // loadingStatus.value = false;
        }
      }
    } catch (e, l) {
      print(runtimeType);
      print(e);
      print(l);
      // loadingStatus.value = false;
    }


  }
}