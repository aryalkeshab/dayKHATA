import 'package:flutter/material.dart';
import 'package:my_app/View/Auth/login_page.dart';
import 'package:get/get.dart';
import 'package:my_app/utils/app_pages.dart';
import 'package:my_app/utils/scroll_behaviour.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: MainPage(),
//     );
//   }
// }

// class MainPage extends StatefulWidget {
//   const MainPage({super.key});

//   @override
//   State<MainPage> createState() => _MainPageState();
// }

// class _MainPageState extends State<MainPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Container(
//           padding: const EdgeInsets.all(30),
//           width: 220,
//           height: 220,
//           decoration: BoxDecoration(
//             color: const Color.fromARGB(255, 135, 131, 221),
//             shape: BoxShape.rectangle,
//             borderRadius: BorderRadius.circular(140),
//           ),
//           child: Image.asset(
//             'asset/images/daylogo.png',
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         foregroundColor: Colors.white,
//         backgroundColor: const Color.fromARGB(255, 135, 131, 221),
//         elevation: 0,
//         onPressed: () {
//           Navigator.of(context).push(MaterialPageRoute(
//             builder: (BuildContext context) {
//               return const LoginPage();
//             },
//           ));
//         },
//         child: const Icon(Icons.arrow_forward_outlined,
//             size: 28, color: Color.fromRGBO(49, 26, 187, 1)),
//       ),
//     );
//   }
// }
void main() {
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
      home: const LoginPage(),
    );
  }
}
