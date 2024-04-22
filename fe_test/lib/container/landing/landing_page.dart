import 'package:fe_test/util/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fe_test/container/login/login_page.dart';
import 'package:fe_test/container/register/register_page.dart';
import 'package:fe_test/authentication/authentication.dart';
import 'package:fe_test/state/cubit/connections_cubit.dart'; // Import your ConnectionsCubit file

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppConstant.initialize(context);
    return Scaffold(
      body: Center(
        child: Container(
          width: AppConstant.width_screen,
          height: AppConstant.height_screen,
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
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: AppConstant.btnWidth,
                  height: AppConstant.btnHeight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        10), // Adjust the radius as needed
                    color: Colors.blue, // Set your desired background color
                  ),
                  child: Center(
                    child: InkWell(
                      child: const Text("Login",
                          style: TextStyle(color: Colors.white)),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BlocProvider.value(
                              value:
                                  BlocProvider.of<AuthenticationBloc>(context),
                              child: LoginPage(),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  width: AppConstant.btnWidth,
                  height: AppConstant.btnHeight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        10), // Adjust the radius as needed
                    color: Colors.blue, // Set your desired background color
                  ),
                  child: Center(
                    child: InkWell(
                      child: const Text("Register",
                          style: TextStyle(color: Colors.white)),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BlocProvider.value(
                              value:
                                  BlocProvider.of<AuthenticationBloc>(context),
                              child: const RegisterPage(),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
