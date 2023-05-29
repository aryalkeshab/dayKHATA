// import 'package:get/get.dart';
// import 'package:my_app/View/Auth/sign_up.dart';
// import 'package:my_app/utils/app_routes.dart';

// import '../View/Auth/login_page.dart';

// class AppRoutes {
//   static appRoutes() => [
//         GetPage(
//           name: RouteName.loginPage,
//           page: () => const LoginPage(),
//         ),
//          GetPage(
//           name: RouteName.signupScreen,
//           page: () => const Signup(),
//         ),

//       ];
// }

import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:my_app/View/Auth/login_page.dart';
import 'package:my_app/View/Auth/sign_up.dart';

import '../View/Auth/newpasswordpage.dart';
import '../View/Auth/verificationpage.dart';
import '../View/homepage/overview.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  final initial = Routes.login;

  static final routes = [
    // GetPage(
    //   name: _Paths.splash,
    //   page: SplashScreen.new,
    // ),
    GetPage(
      name: _Paths.login,
      page: LoginPage.new,
    ),
    GetPage(
      name: _Paths.signup,
      page: Signup.new,
    ),
    GetPage(
      name: _Paths.verify,
      page: Verificationpage.new,
    ),
    GetPage(
      name: _Paths.setnewpassword,
      page: Newpassword.new,
    ),
    GetPage(
      name: _Paths.overview,
      page: Overview.new,
    )
  ];
}
