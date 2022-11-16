import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mehers_kitchen/AddToCard/bloc/cart_bloc.dart';
import 'package:mehers_kitchen/database/foodmodel_provider.dart';
import 'package:mehers_kitchen/modelclasses/food_model.dart';
import 'package:provider/provider.dart';

class MyCartPage extends StatefulWidget {
  List<FoodModelData> list;
  double subtotalPrice;
  double salesTax;
  double deliverCharges;
  double total;
  MyCartPage(
      {Key? key,
      required this.list,
      required this.subtotalPrice,
      required this.salesTax,
      required this.deliverCharges,
      required this.total})
      : super(key: key);

  @override
  State<MyCartPage> createState() => _MyCartPageState();
}

class _MyCartPageState extends State<MyCartPage> {
  ProductDbProvider productDbProvider = ProductDbProvider();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height - kToolbarHeight;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0Xff342f36),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: height * .02,
            ),
            SizedBox(
              height: height * .05,
              width: width,
              child: ListTile(
                leading: const Text(
                  "My Cart",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w900),
                ),
                trailing: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    FontAwesomeIcons.xmark,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * .05,
              width: width,
              child: ListTile(
                leading: const Text(
                  "All List",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                trailing: TextButton(
                  onPressed: () {
                    Provider.of<CartBloc>(context, listen: false)
                        .add(CartDeleteAllItemEvent());
                  },
                  child: const Text(
                    "Clear All",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.5,
              child: ListView.builder(
                itemCount: widget.list.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: width * 0.02, vertical: height * 0.01),
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color(0Xff241e20),
                          borderRadius: BorderRadius.circular(10)),
                      height: height * 0.2,
                      child: Row(
                        children: [
                          //image
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 8, top: 8, bottom: 8),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(10)),
                              width: width * 0.35,
                              height: height * .5,
                              child: CachedNetworkImage(
                                imageUrl:
                                    'https://food.elms.pk${widget.list[index].pictureUrl}',
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: imageProvider,
                                    ),
                                  ),
                                ),
                                placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator()),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                          ),

                          //Column
                          SizedBox(
                            width: width * 0.58,
                            child: Column(
                              children: [
                                //1st row name and delete option
                                SizedBox(
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(top: height * 0.04),
                                    child: Row(
                                      children: [
                                        //text
                                        Container(
                                          padding: const EdgeInsets.only(
                                            left: 15,
                                          ),
                                          width: width * 0.40,
                                          child: Text(
                                            widget.list[index].productName
                                                .toString(),
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                        ),
                                        //space
                                        SizedBox(
                                          width: width * 0.05,
                                        ),
                                        //icon delete
                                        SizedBox(
                                          child: GestureDetector(
                                            onTap: () {
                                              Provider.of<CartBloc>(context,
                                                      listen: false)
                                                  .add(CartDeleteSingleItemEvent(
                                                      foodModelData:
                                                          FoodModelData(
                                                              productId: widget
                                                                  .list[index]
                                                                  .productId)));
                                            },
                                            child: const Icon(
                                              Icons.delete,
                                              color: Colors.white,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                //2nd row,add or minus quantity and price
                                SizedBox(
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(top: height * 0.05),
                                    child: Row(
                                      children: [
                                        //space
                                        SizedBox(
                                          width: width * 0.01,
                                        ),
                                        //icon subtraction
                                        SizedBox(
                                          width: width * 0.1,
                                          child: Align(
                                            alignment: Alignment.centerRight,
                                            child: GestureDetector(
                                              onTap: () {
                                                Provider.of<CartBloc>(context,
                                                        listen: false)
                                                    .add(CartSubtractionOfQuantityEvent(
                                                        foodModelData: FoodModelData(
                                                            productId: widget
                                                                .list[index]
                                                                .productId,
                                                            quantity: widget
                                                                .list[index]
                                                                .quantity,
                                                            price: widget
                                                                .list[index]
                                                                .price,
                                                            singleItemPrice: widget
                                                                .list[index]
                                                                .singleItemPrice)));
                                              },
                                              child: const Icon(
                                                Icons.remove,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                        //text quantity
                                        SizedBox(
                                          width: width * 0.15,
                                          child: Center(
                                            child: Text(
                                              widget.list[index].quantity
                                                  .toString(),
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                        //icon add
                                        SizedBox(
                                          width: width * 0.1,
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: GestureDetector(
                                              onTap: () {
                                                Provider.of<CartBloc>(context,
                                                        listen: false)
                                                    .add(
                                                        CartAdditionOfQuantityEvent(
                                                  foodModelData: FoodModelData(
                                                      productId: widget
                                                          .list[index]
                                                          .productId,
                                                      quantity: widget
                                                          .list[index].quantity,
                                                      price: widget
                                                          .list[index].price,
                                                      singleItemPrice: widget
                                                          .list[index]
                                                          .singleItemPrice),
                                                ));
                                              },
                                              child: const Icon(
                                                Icons.add,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                        //text price
                                        SizedBox(
                                          width: width * 0.2,
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: width * 0.03),
                                            child: Text(
                                              widget.list[index].price
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: height * 0.02),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
                color: Colors.grey.shade800,
              ),
            ),
            SizedBox(
              height: height * .18,
              width: width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(
                      height: height * .03,
                      width: width,
                      child: ListTile(
                        leading: const Text(
                          "SubTotal",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        trailing: Text(
                          widget.subtotalPrice.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * .03,
                      width: width,
                      child: ListTile(
                        leading: const Text(
                          "TexCharges",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        trailing: Text(
                          widget.salesTax.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * .03,
                      width: width,
                      child: ListTile(
                        leading: const Text(
                          "DeliveryCharges",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        trailing: Text(
                          widget.deliverCharges.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * .03,
                      width: width,
                      child: ListTile(
                        leading: const Text(
                          "Total",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        trailing: Text(
                          widget.total.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
                color: Colors.grey.shade800,
              ),
            ),
            SizedBox(
              height: height * .05,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: GestureDetector(
                onTap: () async {
                  List<FoodModelData> list =
                      await productDbProvider.fetchData();
                  CartBloc cartBloc = Provider.of(context, listen: false);
                  cartBloc.add(ProceedToCheckOutSuccessfullyEvent(list: list));
                },
                child: Container(
                  height: height * .07,
                  width: width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0Xffe8c03a)),
                  child: const Center(
                    child: Text("Proceed To checkout"),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * .04,
              width: width,
            )
          ],
        ),
      ),
    );
  }
}
