import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/Core/utils/scroll_behaviour.dart';
import 'Core/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
      scrollBehavior: CustomScrollBehaviour(),
      initialRoute: Routes.splash,
    );
  }
}
