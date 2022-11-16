// ignore_for_file: use_build_context_synchronously

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:mehers_kitchen/AddToCard/bloc/cart_bloc.dart';
import 'package:mehers_kitchen/bloc/detailscreenbloc/detail_screen_add_to_cart_bloc.dart';
import 'package:mehers_kitchen/database/foodmodel_provider.dart';

import 'package:mehers_kitchen/modelclasses/food_model.dart';
import 'package:mehers_kitchen/screens/cart_screen_page.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatelessWidget {
  ProductDbProvider productDbProvider = ProductDbProvider();
  String? imageFile;
  double? salePrice;
  String? productName;
  String? description;
  String? productId;
  DetailPage({
    Key? key,
    this.imageFile,
    this.salePrice,
    this.productName,
    this.description,
    this.productId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height - kToolbarHeight;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0Xff493f4a),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: IconButton(
              onPressed: () async {
                List<FoodModelData> list = await productDbProvider.fetchData();
                if (list.isEmpty) {
                  Provider.of<CartBloc>(context, listen: false)
                      .add(CartEmptyEvent());
                  SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const CartScreen();
                      },
                    ));
                  });
                } else {
                  Provider.of<CartBloc>(context, listen: false)
                      .add(CartLoadedEvent());
                  SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const CartScreen();
                      },
                    ));
                  });
                }
              },
              icon: const Icon(Icons.shopping_cart, color: Colors.white),
            ),
          ),
        ],
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Color(0Xff544147),
                Color(0Xff5f4045),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.2, 0.9]),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Container(
                height: height * .40,
                width: width,
                decoration: const BoxDecoration(
                  color: Color(0Xff5c5157),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(3, -3),
                        blurRadius: 2,
                        spreadRadius: 2),
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(-3, 3),
                        blurRadius: 2,
                        spreadRadius: 2),
                  ],
                ),
                // child: Image.network("https://food.elms.pk${model.getImage()}"),
                child: CachedNetworkImage(
                  imageUrl: "https://food.elms.pk${imageFile.toString()}",
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              SizedBox(
                height: height * .03,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Container(
                  height: height * .10,
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(
                        colors: [
                          Color(0Xff665263),
                          Color(0Xff40353d),
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        stops: [0.2, 0.7]),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 40,
                              child: Text(
                                productName.toString(),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            const Spacer(flex: 45),
                            Expanded(
                              flex: 15,
                              child: Text(
                                salePrice.toString(),
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        const Text(
                          'Taste that you Love',
                          style: TextStyle(color: Colors.white54, fontSize: 15),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * .02,
              ),
              SizedBox(
                height: height * .05,
                width: width,
                child: const ListTile(
                  leading: Icon(
                    Icons.timelapse,
                    color: Color(0Xffe39709),
                  ),
                  title: Text(
                    '20-30 min',
                    style: TextStyle(color: Colors.white38),
                  ),
                ),
              ),
              SizedBox(
                height: height * .02,
              ),
              SizedBox(
                height: height * .05,
                width: width,
                child: Text(
                  description.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                height: height * .23,
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0Xffe39709),
        onPressed: () async {
          Provider.of<DetailScreenAddToCartBloc>(context, listen: false).add(
            DetailScreenAddToCartSuccessfullyEvent(
              foodModelData: FoodModelData(
                  productId: productId,
                  pictureUrl: imageFile,
                  productName: productName,
                  price: salePrice,
                  singleItemPrice: salePrice,
                  quantity: 1),
            ),
          );
        },
        label: InkWell(
          onTap: () {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('Added To Cart')));
          },
          child: const Text(
            'Add To Cart',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w900, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
