// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class AmountReceivedController extends GetxController {
//   @override
//   void onInit() {
//     // TODO: implement onInit
//     super.onInit();
//   }

//   showButtonSheet(BuildContext context) {
//     return showModalBottomSheet(
//       context: context,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(
//           top: Radius.circular(18.0),
//         ),
//       ),
//       builder: ((builder) {
//         return const SizedBox(
//           height: 120,
//           child: Column(
//             children: <Widget>[
//               SizedBox(
//                 height: 10,
//               ),
//               Text(
//                 "Choose profile photo",
//                 style: TextStyle(
//                   fontSize: 20.0,
//                 ),
//               ),
//               Divider(),
//               Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     // if (widget.showCameraIcon)
//                     // ElevatedButton(
//                     //   icon: Icons.camera_alt_outlined,
//                     //   name: "Camera",
//                     //   ontap: () async {
//                     //     // takePhoto(ImageSource.camera);
//                     //     imageFile = await imagePicker(ImageSource.camera);
//                     //     update();
//                     //   },
//                     // ),
//                     // SBC.lW,
//                     SizedBox(
//                       width: 20,
//                     ),
//                     // CustomIconButton(
//                     //   icon: Icons.image,
//                     //   name: "Gallery",
//                     //   ontap: () async {
//                     //     imageFile = await imagePicker(ImageSource.gallery);
//                     //     update();
//                     //   },
//                     // ),
//                   ])
//             ],
//           ),
//         );
//       }),
//     );
//   }
// }
