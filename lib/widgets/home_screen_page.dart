// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mehers_kitchen/AddToCard/bloc/cart_bloc.dart';
import 'package:mehers_kitchen/database/foodmodel_provider.dart';
import 'package:mehers_kitchen/modelclasses/category_id_model_page.dart';
import 'package:mehers_kitchen/modelclasses/food_model.dart';
import 'package:mehers_kitchen/modelclasses/product_by_id.dart';
import 'package:mehers_kitchen/modelclasses/product_list_model.dart';
import 'package:mehers_kitchen/screens/cart_screen_page.dart';
import 'package:mehers_kitchen/screens/category/detail_page.dart';
import 'package:mehers_kitchen/tabsrepository/tabsbloc/bloc/tas_bloc.dart';

import 'package:provider/provider.dart';

import '../bloc/productbyidbloc/product_by_id_bloc.dart';
import '../tabsrepository/tabsbloc/bloc/tas_event.dart';
import '../tabsrepository/tabsbloc/bloc/tas_state.dart';

class HomeScreenLoadingUI extends StatelessWidget {
  const HomeScreenLoadingUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class HomeScreenCategoryLoadedUI extends StatelessWidget {
  int? currentProductId;
  // final List<CategoryModel> categoryList;
  ProductDbProvider productDbProvider = ProductDbProvider();

  HomeScreenCategoryLoadedUI({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeScreenCategoryBloc =
        Provider.of<HomeScreenCategoryBloc>(context, listen: false);
    homeScreenCategoryBloc
        .add(HomeScreenCategoryFetchCategoryListSuccessfullyEvent());

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double height = constraints.maxHeight;
        double width = constraints.maxWidth;
        return Column(
          children: [
            //row...two icons
            SizedBox(
              height: height * 0.2,
              child: Row(
                children: [
                  SizedBox(
                    width: width * 0.05,
                  ),
                  SizedBox(
                    width: width * 0.1,
                    child: InkWell(
                      onTap: () {
                        Scaffold.of(context).openDrawer();
                      },
                      child: const Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.7,
                  ),
                  SizedBox(
                    width: width * 0.1,
                    child: InkWell(
                      onTap: () async {
                        List<FoodModelData> list =
                            await productDbProvider.fetchData();
                        if (list.isEmpty) {
                          // ignore: use_build_context_synchronously
                          Provider.of<CartBloc>(context, listen: false)
                              .add(CartEmptyEvent());
                          SchedulerBinding.instance
                              .addPostFrameCallback((timeStamp) {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return const CartScreen();
                              },
                            ));
                          });
                        } else {
                          // ignore: use_build_context_synchronously
                          Provider.of<CartBloc>(context, listen: false)
                              .add(CartLoadedEvent());
                          SchedulerBinding.instance
                              .addPostFrameCallback((timeStamp) {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return const CartScreen();
                              },
                            ));
                          });
                        }
                      },
                      child: const Icon(
                        Icons.shopping_cart_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.05,
                  )
                ],
              ),
            ),
            //space

            SizedBox(
              height: height * 0.15,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: width * 0.09),
                  child: Text(
                    "Mehar's Kitchen",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: height * 0.07),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.10,
              child: Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: width * 0.09),
                  child: Text(
                    'Better Taste',
                    style: TextStyle(
                        color: Colors.white60, fontSize: height * 0.06),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * .05,
            ),
            BlocBuilder<HomeScreenCategoryBloc, HomeScreenCategoryState>(
              builder: (context, state) {
                if (state is HomeScreenCategoryInitialState) {
                  return const Text('No Category Found');
                } else if (state is HomeScreenCategoryLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state
                    is HomeScreenCategoryListSuccessfullyLoadedState) {
                  return SizedBox(
                    height: height * 0.15,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final List<CategoryModel> categoryList = state.list;
                        return Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.03),
                            child: GestureDetector(
                              onTap: () {
                                currentProductId =
                                    categoryList[index].CategoryId;

                                Provider.of<HomeScreenProductBloc>(context,
                                        listen: false)
                                    .add(
                                        HomeScreenCategoryFetchCategoryByIdSuccessfullyEvent(
                                            categoryId: currentProductId!));
                              },
                              child: Text(
                                categoryList[index].CategoryTitle.toString(),
                                style: const TextStyle(color: Colors.white),
                              ),
                            ));
                      },
                      itemCount: 7,
                    ),
                  );
                } else if (state is HomeScreenCategoryListFailedState) {
                  SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.message),
                      ),
                    );
                  });
                  return const SizedBox();
                } else {
                  return const Center(child: Text('Builder Error'));
                }
              },
            ),
            //most popular
            SizedBox(
              height: height * 0.06,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: width * 0.06),
                  child: Text(
                    'Most Popular',
                    style:
                        TextStyle(color: Colors.white, fontSize: height * 0.06),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class HomeScreenProductLoadedUI extends StatelessWidget {
  final List<ProductListModel>? productList;
  final List<ProductByIdModel>? productListById;

  const HomeScreenProductLoadedUI(
      {Key? key, this.productListById, this.productList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double height = constraints.maxHeight;
        double width = constraints.maxWidth;
        return GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          itemCount: productListById!.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: width * 0.03,
              crossAxisSpacing: height * 0.03,
              childAspectRatio: .8,
              crossAxisCount: 2),
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () {
                  String imageFile =
                      productListById![index].imageFile.toString();
                  double salePrice = productListById![index].salePrice!;
                  String productName =
                      productListById![index].productName.toString();
                  String description =
                      productListById![index].description.toString();
                  String productId =
                      productListById![index].productId.toString();

                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return DetailScreen(
                        imageFile: imageFile,
                        salePrice: salePrice,
                        productName: productName,
                        description: description,
                        productId: productId,
                      );
                    },
                  ));
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color(0Xff332927),
                      borderRadius: BorderRadius.circular(width * 0.03)),
                  height: height,
                  child: LayoutBuilder(
                    builder: (p0, p1) {
                      double height = p1.maxHeight;
                      return Column(
                        children: [
                          SizedBox(
                            height: height * 0.05,
                          ),
                          SizedBox(
                            height: height * 0.5,
                            child: CachedNetworkImage(
                              imageUrl:
                                  'https://food.elms.pk${productListById![index].imageFile!}',
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                            // Image.network(productList[index].imageFile!),
                          ),
                          SizedBox(
                            height: height * 0.03,
                          ),
                          SizedBox(
                            height: height * 0.12,
                            child: Text(
                              productListById![index].productName.toString(),
                              style: TextStyle(
                                  fontSize: height * 0.09, color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.20,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.03),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                      width: p1.maxWidth * 0.2,
                                      child: Text(
                                        'UED',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: p1.maxHeight * 0.08),
                                      )),
                                  SizedBox(
                                      width: p1.maxWidth * 0.3,
                                      child: Text(
                                        productListById![index]
                                            .salePrice
                                            .toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: p1.maxHeight * 0.08),
                                      )),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.1,
                          ),
                        ],
                      );
                    },
                  ),
                ));
          },
        );
      },
    );
  }
}

class HomeScreenProductNotAvailabelProductUI extends StatelessWidget {
  const HomeScreenProductNotAvailabelProductUI({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.brown.shade900,
      child: Center(
        child: Text(
          'Sorry Not Availabel this Time',
          style: TextStyle(color: Colors.white, fontSize: height * 0.02),
        ),
      ),
    );
  }
}
