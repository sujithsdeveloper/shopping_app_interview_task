import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_app_interview_task/model/productModel.dart';

class HomescreeenController with ChangeNotifier {
  // List<ProductlModel> productList = [];
  // bool isLoading = false;
  // Future<void> GetData() async {
  //   isLoading = true;
  //   notifyListeners();
  //   try {
  //     var url = Uri.parse('https://fakestoreapi.com/products');
  //     var response = await http.get(url);
  //     if (response.statusCode == 200) {
  //       productList = productlModelFromJson(response.body);
  //       log(productList.toString());
  //     }
  //     isLoading = false;
  //     notifyListeners();
  //   } catch (e) {
  //     log(e.toString());
  //   }
  // }

  // void addAProduct(
  //     {required String title,
  //     required double price,
  //     required String description,
  //     required String image,
  //     required String category}) {
  //   try {
  //     var url = Uri.parse('https://fakestoreapi.com/products');
  //     http.post(url,
  //         body: productDetailModelToJson(ProductDetailModel(
  //           title: title,
  //           category: category,
  //           description: description,
  //           image: image,
  //           price: price,
  //         )));
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  List<Map<String, dynamic>> productDataList = [
    {
      'title': 'Men\'s Black Shirt',
      'price': 360,
      'description': 'A stylish black shirt perfect for any occasion.',
      'category': 'mens wear',
      'image':
          'https://images.pexels.com/photos/90946/pexels-photo-90946.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1.'
    },
    {
      'title': 'Women\'s Casual Dress',
      'price': 550,
      'description': 'Comfortable casual dress for everyday wear.',
      'category': 'womens wear',
      'image':
          'https://images.pexels.com/photos/1667088/pexels-photo-1667088.jpeg?auto=compress&cs=tinysrgb&w=600'
    },
    {
      'title': 'Sports Sneakers',
      'price': 1200,
      'description': 'Durable and lightweight sneakers for active lifestyle.',
      'category': 'footwear',
      'image':
          'https://images.pexels.com/photos/2536965/pexels-photo-2536965.jpeg?auto=compress&cs=tinysrgb&w=600'
    },
    {
      'title': 'Men\'s Formal Pants',
      'price': 700,
      'description': 'Elegant formal pants ideal for office wear.',
      'category': 'mens wear',
      'image':
          'https://images.pexels.com/photos/279906/pexels-photo-279906.jpeg?auto=compress&cs=tinysrgb&w=600'
    },
    {
      'title': 'Women\'s Handbag',
      'price': 980,
      'description': 'Spacious and stylish handbag for daily use.',
      'category': 'accessories',
      'image': 'https://example.com/images/handbag.jpg'
    },

  ];

  void addAProduct(
      {required String title,
      required String description,
      required String category,
      required String price,
      required String image}) {
    productDataList.add(
      {
        'title': title,
        'price': price,
        'description': description,
        'category': category,
        'image': image
      },
    );
    notifyListeners();
  }

  void deleteProduct(int index){

    productDataList.removeAt(index);
    notifyListeners();

  }
}
