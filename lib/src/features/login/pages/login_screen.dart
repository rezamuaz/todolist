import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todolist/gen/assets.gen.dart';
import 'package:todolist/src/core/constants/q_colors.dart';
import 'package:todolist/src/features/dashboard/pages/dashboard_screen.dart';
import 'package:todolist/src/features/registation/pages/registration_screen.dart';
import 'package:todolist/src/features/shared/button/q_button.dart';
import 'package:todolist/src/features/shared/form/q_input_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final registerForm1Key = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController whatsapp = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //     automaticallyImplyLeading: false,
      //     systemOverlayStyle:
      //         const SystemUiOverlayStyle(statusBarColor: Colors.transparent)),

      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [
            Positioned(
              child: SvgPicture.asset(
                Assets.svgs.shape1.path,
                height: 140,
                width: 140,
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Welcome Back!",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: QColors.grey_100),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SvgPicture.asset(
                      Assets.svgs.loginImg.path,
                      height: 180,
                      width: 180,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Form(
                      key: registerForm1Key,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          QInputForm(
                            onTap: () {},
                            decoration: const InputDecoration(),
                            readOnly: false,
                            labelText: "Email",
                            controller: name,
                            style: const TextStyle(color: QColors.grey_60),
                            validator: (p0) {
                              if (p0!.isEmpty) {
                                return "name is empty";
                              }
                              return null;
                            },
                            // showError: controller.showErrorMessage,
                            // controller: controller.vehicleName,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          QInputForm(
                            onTap: () {},
                            decoration: const InputDecoration(),
                            readOnly: false,
                            labelText: "Password",
                            controller: name,
                            style: const TextStyle(color: QColors.grey_60),
                            validator: (p0) {
                              if (p0!.isEmpty) {
                                return "name is empty";
                              }
                              return null;
                            },
                            // showError: controller.showErrorMessage,
                            // controller: controller.vehicleName,
                          ),
                          Container(
                              padding: const EdgeInsets.only(right: 20),
                              width: double.infinity,
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                style: ButtonStyle(
                                    splashFactory: NoSplash.splashFactory,
                                    padding: MaterialStateProperty.all(
                                        EdgeInsets.zero)),
                                onPressed: () {},
                                child: Text(
                                  "Forgot Password?",
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              )),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.only(top: 20),
                            child: Material(
                              color: Colors.transparent,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushReplacement(_createRouteHome());
                                },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Theme.of(context).primaryColor),
                                  foregroundColor:
                                      MaterialStateProperty.all(Colors.black),
                                  padding: MaterialStateProperty.all(
                                      const EdgeInsets.symmetric(
                                          horizontal: 24.0, vertical: 12.0)),
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  overlayColor:
                                      MaterialStateProperty.resolveWith<Color?>(
                                    (Set<MaterialState> states) {
                                      if (states
                                          .contains(MaterialState.pressed)) {
                                        return Colors.white.withOpacity(
                                            0.3); // Ripple effect color
                                      }
                                      return null; // Defer to the default foreground color
                                    },
                                  ),
                                ),
                                child: const Text(
                                  'Login',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                "Don’t have an account ?",
                                style: TextStyle(
                                  color: QColors.grey_80,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              TextButton(
                                style: ButtonStyle(
                                    splashFactory: NoSplash.splashFactory,
                                    padding: MaterialStateProperty.all(
                                        EdgeInsets.zero)),
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushReplacement(_createRoute());
                                },
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const RegistrationScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Route _createRouteHome() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const DashboardScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
