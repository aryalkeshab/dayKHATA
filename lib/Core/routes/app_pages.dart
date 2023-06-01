import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:my_app/Core/api/core_bindings.dart';
import 'package:my_app/Screen/Auth/View/login_page.dart';
import 'package:my_app/Screen/Auth/View/sign_up.dart';
import 'package:my_app/Screen/Payment/View/amount_received.dart';

import '../../Screen/Auth/View/newpasswordpage.dart';
import '../../Screen/Auth/View/verificationpage.dart';
import '../../Screen/Purchase/purchase_screen.dart';
import '../../Screen/Splash/splash.dart';
import '../../Screen/homepage/overview.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  final initial = Routes.splash;

  static final routes = [
    GetPage(name: _Paths.splash, page: SplashScreen.new, bindings: [
      CoreBindings(),
    ]),
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
    ),
    GetPage(
      name: _Paths.amountReceived,
      page: AmountReceived.new,
    ),
    GetPage(
      name: _Paths.purchaseCash,
      page: PurchaseScreen.new,
    )
  ];
}
