import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:shopping_app_interview_task/model/productDetailModel.dart';

class ProductdetailsController with ChangeNotifier {
  ProductDetailModel? productDetailModel;
  bool isLoading = false;
  Future<void> getProductDetails(String id) async {
    isLoading = true;
    notifyListeners();
    try {
      var url = Uri.parse('https://fakestoreapi.com/products/$id');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        productDetailModel = productDetailModelFromJson(response.body);
      }
      isLoading = false;
      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
  }
}
