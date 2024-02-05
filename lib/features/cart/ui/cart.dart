import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences_and_bloc/features/cart/bloc/cart_bloc.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    final CartBloc cartBloc = CartBloc();
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Items'),
      ),
      body: BlocConsumer<CartBloc, CartState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Container();
        },
      ),
    );
  }
}
