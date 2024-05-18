import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todolist/gen/assets.gen.dart';
import 'package:todolist/src/core/constants/q_colors.dart';
import 'package:todolist/src/features/login/pages/login_screen.dart';
import 'package:todolist/src/features/shared/button/q_button.dart';
import 'package:todolist/src/features/shared/form/q_input_form.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
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
                padding: const EdgeInsets.only(top: 80, left: 20, right: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: 60,
                    ),
                    const Text(
                      "Welcome Onboard!",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: QColors.grey_100),
                    ),
                    Container(
                      child: const Text(
                        "Lets help you in completing your tasks",
                        style: TextStyle(
                          color: QColors.grey_80,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
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
                            labelText: "Full name",
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
                          const SizedBox(
                            height: 5,
                          ),
                          QInputForm(
                            onTap: () {},
                            decoration: const InputDecoration(),
                            readOnly: false,
                            labelText: "Confirm Password",
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
                            height: 20,
                          ),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.only(top: 30),
                            child: Material(
                              color: Colors.transparent,
                              child: ElevatedButton(
                                onPressed: () {
                                  print('Custom ElevatedButton pressed');
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
                                  'Register',
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
                                "Already have an account ? ",
                                style: TextStyle(
                                  color: QColors.grey_80,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              TextButton(
                                style: const ButtonStyle(
                                    splashFactory: NoSplash.splashFactory),
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushReplacement(_createRoute());
                                },
                                child: Text(
                                  " Sign In",
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
            const Column(
              mainAxisSize: MainAxisSize.min,
              children: [],
            )
          ],
        ),
      ),
    );
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const LoginScreen(),
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
