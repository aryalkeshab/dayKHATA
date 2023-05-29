// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:my_app/View/Auth/login_page.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key? key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();

//     Timer(const Duration(seconds: 2), () async {
//       await Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (context) => const LoginPage(),
//         ),
//       );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(
//               'asset/images/daylogo.png',
//               filterQuality: FilterQuality.high,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_pages.dart';
import '../Auth/login_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SplashAnimationController>(
        init: SplashAnimationController(),
        builder: (controller) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'asset/images/daylogo.png',
                filterQuality: FilterQuality.high,
                width: MediaQuery.of(context).size.height * 0.5,
                height: MediaQuery.of(context).size.height * 0.5,
              ),
            ],
          );
        },
      ),
    );
  }
}

class SplashAnimationController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void onInit() {
    // TODO: implement onInit
    initAnimation();
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    animationController.dispose();
    super.dispose();
  }

  initAnimation() {
    Timer(const Duration(seconds: 2), () async {
      await Get.toNamed(Routes.login);
    });

    // animationController = AnimationController(
    //   vsync: this,
    //   duration: const Duration(seconds: 2),
    // );
    // animation =
    //     CurvedAnimation(parent: animationController, curve: Curves.easeOut)
    //         .obs
    //         .value;
    // animation.addListener(() => update());
    // animationController.forward().whenComplete(() async {
    //   Get.offNamed(Routes.login);
    // });
  }
}
