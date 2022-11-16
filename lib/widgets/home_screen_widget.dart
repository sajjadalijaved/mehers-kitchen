import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mehers_kitchen/bloc/productbyidbloc/product_by_id_bloc.dart';

import 'package:mehers_kitchen/widgets/home_screen_page.dart';
import 'package:provider/provider.dart';

class ShowScreen extends StatelessWidget {
  const ShowScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeScreenProductBloc =
        Provider.of<HomeScreenProductBloc>(context, listen: false);
    homeScreenProductBloc.add(
        HomeScreenCategoryFetchCategoryByIdSuccessfullyEvent(categoryId: 0));
    return BlocBuilder<HomeScreenProductBloc, HomeScreenProductState>(
      builder: (context, state) {
        if (state is HomeScreenProductLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is HomeScreenCategoryByIdState) {
          return HomeScreenProductLoadedUI(productListById: state.list);
        } else if (state is HomeScreenProductListFailedState) {
          SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          });
          return const SizedBox();
        } else if (state is HomeScreenCategoryByIdState) {
          return HomeScreenProductLoadedUI(
            productListById: state.list,
          );
        } else if (state is HomeScreenEmptyListState) {
          return const HomeScreenProductNotAvailabelProductUI();
        } else {
          return const Center(
            child: Text('Builder Error'),
          );
        }
      },
    );
  }
}
