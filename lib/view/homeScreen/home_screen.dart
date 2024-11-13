import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app_interview_task/main.dart';
// import 'package:provider/provider.dart';

import 'package:shopping_app_interview_task/utils/functions/styles.dart';
import 'package:shopping_app_interview_task/view/homeScreen/homeScreeen_controller.dart';
// import 'package:shopping_app_interview_task/view/homeScreen/homeScreeen_controller.dart';
import 'package:shopping_app_interview_task/view/productDetailScreen/productDetailScreen.dart';
import 'package:shopping_app_interview_task/widgets/textfeildWidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // @override
  // void initState() {
  //   super.initState();

  //   WidgetsBinding.instance.addPostFrameCallback(
  //     (timeStamp) {
  //       context.read<HomescreeenController>().GetData();
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final proRead = context.read<HomescreeenController>();
    final proWatch = context.watch<HomescreeenController>();
    final titleController = TextEditingController();
    final priceController = TextEditingController();
    final categoryController = TextEditingController();
    final descController = TextEditingController();
    final imageController = TextEditingController();

    List<Map> controllerList = [
      {'controller': titleController, 'label': 'title'},
      {'controller': priceController, 'label': 'price'},
      {'controller': categoryController, 'label': 'category'},
      {'controller': descController, 'label': 'description'},
      {'controller': imageController, 'label': 'image'},
    ];
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => StatefulBuilder(
                builder: (context, setState) => Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ListView(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Add a product',
                            style: StringStyle.titleStyle(),
                          ),
                        ),
                        Column(
                            children: List.generate(
                          controllerList.length,
                          (index) => textfeildwidget(
                            titleController: controllerList[index]
                                ['controller'],
                            label: controllerList[index]['label'],
                          ),
                        )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('Cancel')),
                            SizedBox(
                              width: 30,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  proRead.addAProduct(
                                      title: titleController.text,
                                      description: descController.text,
                                      category: categoryController.text,
                                      price: priceController.text,
                                      image: imageController.text);

                                  Navigator.pop(context);
                                  titleController.clear();
                                  descController.clear();
                                  categoryController.clear();
                                  priceController.clear();
                                  imageController.clear();
                                },
                                child: Text('Add'))
                          ],
                        ),
                        SizedBox(
                          height: 50,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Shopping App',
            style: StringStyle.AppBarTextstyle(),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GridView.builder(
            itemCount: proWatch.productDataList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 20, crossAxisSpacing: 20),
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Productdetailscreen(
                        title: proWatch.productDataList[index]['title'],
                        category: proWatch.productDataList[index]['category'],
                        description: proWatch.productDataList[index]
                            ['description'],
                        image: proWatch.productDataList[index]['image'],
                        price:
                            proWatch.productDataList[index]['price'].toString(),
                      ),
                    ));
              },
              child: Stack(
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            height: 100,
                            width: 150,
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(proWatch
                                        .productDataList[index]['image']))),
                          ),
                        ),
                        Text(
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            proWatch.productDataList[index]['title'],
                            style: StringStyle.titleStyle()),
                        Text(
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            proWatch.productDataList[index]['description']),
                        Text('\$${proWatch.productDataList[index]['price']}',
                            style: StringStyle.priceStyle()),
                      ],
                    ),
                  ),
                  Positioned(
                      right: 0,
                      child: IconButton(
                          onPressed: () {
                            proRead.deleteProduct(index);
                          },
                          icon: Icon(Icons.delete)))
                ],
              ),
            ),
          ),
        ));
  }
}
