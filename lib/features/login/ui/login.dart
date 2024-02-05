import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences_and_bloc/features/home/ui/home.dart';
import 'package:shared_preferences_and_bloc/features/login/bloc/login_bloc.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final LoginBloc loginBloc = LoginBloc();
    return BlocConsumer<LoginBloc, LoginState>(
      bloc: loginBloc,
      listenWhen: (previous, current) => current is LoginActionState,
      listener: (context, state) {
        if (state is LoginNavigateToHomeScreenState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomePage()));
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Column(
            children: [
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                    hintText: "Email", labelText: "Email"),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                    hintText: "Password", labelText: "Password"),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    loginBloc.add(LoginButtonClickedEvent(
                        email: emailController.text,
                        password: passwordController.text));
                  },
                  child: const Text("Submit"))
            ],
          ),
        );
      },
    );
  }
}
