import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mehers_kitchen/AddToCard/additem_page.dart';
import 'package:mehers_kitchen/AddToCard/bloc/cart_bloc.dart';
import 'package:mehers_kitchen/screens/checkout_screen.dart';
import 'package:mehers_kitchen/widgets/cart_screen_widget.dart';
import 'package:mehers_kitchen/widgets/detail_screen_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartEmptyState) {
            return const CartScreenEmptyUI();
          } else if (state is CartLoadedState) {
            return MyCartPage(
              list: state.list,
              subtotalPrice: state.subTotalPrice,
              salesTax: state.salesTax,
              deliverCharges: state.deliverCharges,
              total: state.total,
            );
          } else if (state is CartDeleteAllItemState) {
            return const CartScreenEmptyUI();
          } else if (state is CartDeleteSingleItemSate) {
            return MyCartPage(
              list: state.list,
              subtotalPrice: state.subTotalPrice,
              salesTax: state.salesTax,
              deliverCharges: state.deliveryCharges,
              total: state.total,
            );
          } else if (state is CartAdditionOfQuantityState) {
            return MyCartPage(
              list: state.list,
              subtotalPrice: state.subTotalPrice,
              salesTax: state.salesTax,
              deliverCharges: state.deliveryCharges,
              total: state.total,
            );
          } else if (state is CartSubtractionOfQuantityState) {
            return MyCartPage(
              list: state.list,
              subtotalPrice: state.subTotalPrice,
              salesTax: state.salesTax,
              deliverCharges: state.deliveryCharges,
              total: state.total,
            );
          } else if (state is ProceedToCheckOutSuccessfullyState) {
            SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const CheckoutScreen();
                },
              ));
            });
            return const SizedBox();
          } else if (state is ProceedToCheckOutFailedState) {
            SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            });
            return const SizedBox();
          } else {
            return const Center(
              child: Text('Cart Builder Error'),
            );
          }
        },
      ),
    ));
  }
}
