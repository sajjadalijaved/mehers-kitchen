// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:mehers_kitchen/modelclasses/product_list_model.dart';
// import 'package:mehers_kitchen/modelclasses/data_model.dart';
// import 'package:mehers_kitchen/screens/category/bloc/product_itum_bloc.dart';
// import 'package:mehers_kitchen/screens/category/detail_page.dart';
// import 'package:provider/provider.dart';

// class ShowProductItem extends StatelessWidget {
//   static const String pageName = "ShowProductItem";
//   const ShowProductItem({super.key});

//   @override
//   Widget build(BuildContext context) {
//     ProductItumBloc productItumBloc = Provider.of(context, listen: false);
//     productItumBloc.add(FetchProductItumEvent());
//     return Scaffold(
//       backgroundColor: const Color(0Xff62554c),
//       body: BlocBuilder<ProductItumBloc, ProductItumState>(
//         builder: (context, state) {
//           if (state is ProductItumInitial) {
//             return const Center(
//               child: Text("No Item Posts"),
//             );
//           } else if (state is ProductItumLoadingState) {
//             return const Center(
//               child: CircularProgressIndicator(
//                 color: Colors.blue,
//                 strokeWidth: 5,
//               ),
//             );
//           } else if (state is ProductItumLoadedState) {
//             return GridView.builder(
//               itemCount: state.list.length,
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2, childAspectRatio: .8),
//               itemBuilder: (context, index) {
//                 // List<ProductListModal> list = state.list;
//                 return Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
//                   child: GestureDetector(
//                     onTap: () {
//                       Navigator.pushNamed(context, DetailScreen.pageName,
//                           arguments: DataModel(
//                               // image: list[index].ImageFile,
//                               // itemName: list[index].ProductName,
//                               // price: list[index].SalePrice,
//                               // description: list[index].Description));
//                     },
//                     child: Container(
//                       decoration: BoxDecoration(
//                           color: const Color(0Xff332927),
//                           borderRadius: BorderRadius.circular(20)),
//                       child: Column(
//                         children: [
//                           Expanded(
//                             flex: 65,
//                             // child: Image.network(
//                             //     "https://food.elms.pk${list[index].ImageFile}"),
//                             child: CachedNetworkImage(
//                               imageUrl:
//                                   "https://food.elms.pk${list[index].ImageFile}",
//                               placeholder: (context, url) => const Center(
//                                   child: CircularProgressIndicator()),
//                               errorWidget: (context, url, error) =>
//                                   const Center(
//                                       child: Text("Processing",
//                                           style: TextStyle(fontSize: 20))),
//                             ),
//                           ),
//                           Expanded(
//                             flex: 8,
//                             child: Center(
//                               child: Text(
//                                 list[index].ProductName.toString(),
//                                 style: const TextStyle(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.w500),
//                               ),
//                             ),
//                           ),
//                           const Spacer(
//                             flex: 5,
//                           ),
//                           Expanded(
//                             flex: 22,
//                             child: Row(
//                               children: [
//                                 const Spacer(
//                                   flex: 15,
//                                 ),
//                                 const Expanded(
//                                   flex: 25,
//                                   child: Text(
//                                     "UED:",
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                 ),
//                                 const Spacer(
//                                   flex: 20,
//                                 ),
//                                 Expanded(
//                                   flex: 25,
//                                   child: Text(
//                                     list[index].SalePrice.toString(),
//                                     style: const TextStyle(
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                 ),
//                                 const Spacer(
//                                   flex: 15,
//                                 ),
//                               ],
//                             ),
//                           ),
//                           const Spacer(
//                             flex: 10,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             );
//           } else if (state is ProductItumErrorState) {
//             ScaffoldMessenger.of(context)
//                 .showSnackBar(SnackBar(content: Text(state.message)));
//           }
//           return const SizedBox();
//         },
//       ),
//     );
//   }
// }
