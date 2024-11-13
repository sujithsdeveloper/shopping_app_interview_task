import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app_interview_task/utils/functions/styles.dart';
import 'package:shopping_app_interview_task/view/productDetailScreen/productDetails_controller.dart';

class Productdetailscreen extends StatefulWidget {
  const Productdetailscreen(
      {super.key,
      required this.title,
      required this.description,
      required this.price,
      required this.category,
      required this.image});
  final String title;
  final String description;
  final String price;
  final String category;
  final String image;

  @override
  State<Productdetailscreen> createState() => _ProductdetailscreenState();
}

class _ProductdetailscreenState extends State<Productdetailscreen> {
  // @override
  // void initState() {
  //   super.initState();

  //   WidgetsBinding.instance.addPostFrameCallback(
  //     (timeStamp) {
  //       context.read<ProductdetailsController>().getProductDetails(widget.id);
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    // final prowatch = context.watch<ProductdetailsController>();
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        // showDialog(
        //   context: context,
        //   builder: (context) => AlertDialog(),
        // );
      }),
      appBar: AppBar(
        title: Text('product Details Screen'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
                width: double.infinity,
                height: 300,
                image: NetworkImage(widget.image)),
            SizedBox(height: 20),
            Text(
              widget.title,
              style: StringStyle.titleStyle(),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              '\$${widget.price}',
              style: StringStyle.priceStyle(),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              widget.category,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(widget.description),
          ],
        ),
      ),
    );
  }
}
