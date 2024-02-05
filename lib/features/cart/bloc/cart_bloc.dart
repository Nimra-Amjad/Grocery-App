import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences_and_bloc/data/cart_items.dart';
import 'package:shared_preferences_and_bloc/features/home/models/home_product_data_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartRemoveFromCardEvent>(cardRemoveFromCardEvent);
  }

  FutureOr<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartSuccessState(cartItems: cartItems));
  }

  FutureOr<void> cardRemoveFromCardEvent(
      CartRemoveFromCardEvent event, Emitter<CartState> emit) {
    cartItems.remove(event.prodcutDataModel);
    emit(CartSuccessState(cartItems: cartItems));
  }
}
