import 'package:fe_test/util/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fe_test/container/login/login.dart';
import 'package:formz/formz.dart';
import 'package:fe_test/state/bloc/login/login_bloc.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Authentication Failure')),
            );
        }
      },
      child: Align(
        alignment: const Alignment(0, -1 / 3),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Login"),
            _UsernameInput(controller: usernameController),
            const Padding(padding: EdgeInsets.all(12)),
            _PasswordInput(controller: passwordController),
            const Padding(padding: EdgeInsets.all(12)),
            _LoginButton(
              usernameController: usernameController,
              passwordController: passwordController,
            ),
          ],
        ),
      ),
    );
  }
}

class _UsernameInput extends StatelessWidget {
  final TextEditingController controller;

  const _UsernameInput({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppConstant.initialize(context);
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) {
        return SizedBox(
          width:
              MediaQuery.of(context).size.width * 0.9, // Add width constraint
          child: TextField(
            key: const Key('loginForm_usernameInput_textField'),
            controller: controller,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintStyle: const TextStyle(color: Colors.white12),
              hintText: "Enter Username/Email",
              label: const Text("Username"),
              labelStyle: TextStyle(fontSize: 19),
              errorText: state.username.displayError != null
                  ? 'invalid username'
                  : null,
              filled: true,
              fillColor: Colors.white10,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(
                    color: Colors.transparent), // Set border color
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(
                    color: Colors.transparent,
                    width: 2.0), // Set focused border color and width
              ),
            ),
            onChanged: (username) =>
                context.read<LoginBloc>().add(LoginUsernameChanged(username)),
          ),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  final TextEditingController controller;

  const _PasswordInput({Key? key, required this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return SizedBox(
          width:
              MediaQuery.of(context).size.width * 0.9, // Add width constraint
          child: TextField(
            key: const Key('loginForm_usernameInput_textField'),
            controller: controller,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintStyle: const TextStyle(color: Colors.white12),
              hintText: "Enter Password",
              label: const Text("Password"),
              labelStyle: TextStyle(fontSize: 19),
              errorText: state.password.displayError != null
                  ? 'invalid password'
                  : null,
              filled: true,
              fillColor: Colors.white10,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(
                    color: Colors.transparent), // Set border color
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(
                    color: Colors.transparent,
                    width: 2.0), // Set focused border color and width
              ),
            ),
            onChanged: (password) =>
                context.read<LoginBloc>().add(LoginPasswordChanged(password)),
          ),
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  final TextEditingController usernameController;
  final TextEditingController passwordController;

  const _LoginButton({
    Key? key,
    required this.usernameController,
    required this.passwordController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
        buildWhen: (previous, current) => previous.password != current.password,
        builder: (context, state) {
          return state.status.isInProgress
              ? SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: const CircularProgressIndicator(),
                )
              : SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: AppConstant.height_screen * 0.08,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          final List<Color> filledGradientColors = [
                            Color(0xFF62CDCB),
                            Color(0xFF4599DB),
                          ];
                          final List<Color> emptyGradientColors = [
                            Colors.grey.shade800,
                            Colors.black26,
                          ];
                          if (usernameController.text != "" &&
                              passwordController.text != "") {
                            return filledGradientColors.first;
                          }
                          return emptyGradientColors.first;
                        },
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10), // Set the borderRadius here
                        ),
                      ),
                    ),
                    child: const Text(
                      "Login",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {},
                  ),
                );
        });
  }
}
