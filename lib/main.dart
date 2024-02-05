import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences_and_bloc/features/cart/bloc/cart_bloc.dart';
import 'package:shared_preferences_and_bloc/features/home/bloc/home_bloc.dart';
import 'package:shared_preferences_and_bloc/features/home/ui/home.dart';
import 'package:shared_preferences_and_bloc/features/login/bloc/login_bloc.dart';
import 'package:shared_preferences_and_bloc/features/login/ui/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(),
        ),
        BlocProvider<CartBloc>(
          create: (context) => CartBloc(),
        ),
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.teal),
        home: const Login(),
      ),
    );
  }
}
