import 'package:bloc/bloc.dart';
import 'package:mehers_kitchen/database/foodmodel_provider.dart';
import 'package:mehers_kitchen/modelclasses/food_model.dart';
import 'package:meta/meta.dart';

part 'detail_screen_add_to_cart_event.dart';
part 'detail_screen_add_to_cart_state.dart';

class DetailScreenAddToCartBloc
    extends Bloc<DetailScreenAddToCartEvent, DetailScreenAddToCartState> {
  ProductDbProvider productDbProvider = ProductDbProvider();
  DetailScreenAddToCartBloc() : super(DetailScreenAddToCartInitial()) {
    on<DetailScreenAddToCartInitialEvent>((event, emit) {
      emit.call(DetailScreenAddToCartInitial());
    });

    on<DetailScreenAddToCartSuccessfullyEvent>((event, emit) async {
      FoodModelData foodModelData = event.foodModelData;
      try {
        bool result = await productDbProvider.insertData(foodModelData);
      
        if (result) {
          emit.call(
              DetailScreenAddToCartSuccessfullyState(message: 'Added To Cart'));
        } else {
          emit.call(DetailScreenAddToCartFailedState(message: 'Sorry'));
        }
      } catch (e) {
        emit.call(DetailScreenAddToCartFailedState(
            message: 'You have already added this product in cart'));
      }
    });
  }
}
