part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class CartInitialEvent extends CartEvent {}

class CartRemoveFromCardEvent extends CartEvent {
  final ProductDataModel prodcutDataModel;

  CartRemoveFromCardEvent({required this.prodcutDataModel});
}
