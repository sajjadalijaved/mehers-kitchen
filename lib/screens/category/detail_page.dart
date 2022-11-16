// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mehers_kitchen/bloc/detailscreenbloc/detail_screen_add_to_cart_bloc.dart';
import 'package:mehers_kitchen/widgets/detail_screen_widget.dart';

import 'package:provider/provider.dart';

// ignore: must_be_immutable
class DetailScreen extends StatelessWidget {
  static const String pageName = "DetailScreen";
  String? imageFile;
  double? salePrice;
  String? productName;
  String? description;
  String? productId;
  DetailScreen(
      {Key? key,
      this.imageFile,
      this.salePrice,
      this.productName,
      this.description,
      this.productId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final detailScreenBloc =
        Provider.of<DetailScreenAddToCartBloc>(context, listen: false);
    detailScreenBloc.add(DetailScreenAddToCartInitialEvent());
    return SafeArea(
      child: Scaffold(body:
          BlocBuilder<DetailScreenAddToCartBloc, DetailScreenAddToCartState>(
        builder: (context, state) {
          if (state is DetailScreenAddToCartInitial) {
            return DetailPage(
              productId: productId,
              imageFile: imageFile,
              description: description,
              productName: productName,
              salePrice: salePrice,
            );
          } else if (state is DetailScreenAddToCartSuccessfullyState) {
            detailScreenBloc.add(DetailScreenAddToCartInitialEvent());
            SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            });
            return DetailPage(
              imageFile: imageFile,
              description: description,
              productName: productName,
              salePrice: salePrice,
            );
          } else if (state is DetailScreenAddToCartFailedState) {
            detailScreenBloc.add(DetailScreenAddToCartInitialEvent());
            SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            });
            return DetailPage(
              imageFile: imageFile,
              description: description,
              productName: productName,
              salePrice: salePrice,
            );
          } else {
            return const Center(
              child: Text('No Screen'),
            );
          }
        },
      )),
    );
  }
}
