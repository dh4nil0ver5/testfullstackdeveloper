import 'package:authentication_repository/authentication_repository.dart';
import 'package:fe_test/container/register/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack( 
        children: <Widget>[
          // Base layer with gradient background
          Container(
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                colors: [
                  Color(0xFF1F4247),
                  Color(0xFF0D1D23),
                  Color(0xFF09141A),
                ],
                stops: [0.0, 0.5, 1.0],
              ),
            ),
          ),
          Positioned(
            top: 50, // Adjust position as needed
            left: 20, // Adjust position as needed
            child: Row(
              children: <Widget>[
                InkWell(
                  child: const Icon(
                    Icons.keyboard_arrow_left_sharp,
                    color: Colors.white,
                  ),
                  onTap: () { 
                    Navigator.pop(context);
                  },
                ),
                const Text(
                  "Back",
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ), 
          Positioned(
            top: 100, // Adjust position as needed
            left: 20, // Adjust position as needed
            child: BlocProvider( 
              create: (context) {
                return RegisterBloc(
                  authenticationRepository:
                      RepositoryProvider.of<AuthenticationRepository>(context),
                );
              },
              child: const RegisterForm(),
            ),
          )
        ],
      ),
    );
  }
}