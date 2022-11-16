import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mehers_kitchen/bloc/confirmorderbloc/bloc/confirm_order_bloc.dart';
import 'package:mehers_kitchen/widgets/check_out_page.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(body: BlocBuilder<ConfirmOrderBloc, ConfirmOrderState>(
      builder: (context, state) {
        if (state is ConfirmOrderInitialState) {
          return CheckoutScreenInitialUI();
        } else if (state is ConfirmOrderSuccessfullyState) {
          SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          });
          return CheckoutScreenInitialUI();
        } else if (state is ConfirmOrderFailedState) {
          SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          });
          return CheckoutScreenInitialUI();
        } else {
          return Center(
            child: Text('Checkout screen  error'),
          );
        }
      },
    )));
  }
}
