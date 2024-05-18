import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todolist/gen/assets.gen.dart';
import 'package:todolist/src/core/constants/q_colors.dart';
import 'package:todolist/src/features/dashboard/widget/task_list.dart';
import 'package:todolist/src/features/shared/form/q_input_form.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(0),
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Stack(
              children: [
                Positioned(
                  child: SvgPicture.asset(
                    Assets.svgs.reactangle.path,
                    height: 270,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  child: SvgPicture.asset(
                    Assets.svgs.shape2.path,
                    height: 140,
                    width: 140,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                    left: 0,
                    right: 0,
                    child: Image.asset(Assets.images.ellipse479.path)),
                const Positioned(
                  bottom: 10,
                  left: 0,
                  right: 0,
                  child: Text(
                    "Welcome Marry",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: QColors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 48,
            ),
            SvgPicture.asset(
              Assets.svgs.clock.path,
              height: 126,
              width: 126,
              fit: BoxFit.cover,
            ),
            const TaskList()
          ],
        ),
      ),
    );
  }
}
