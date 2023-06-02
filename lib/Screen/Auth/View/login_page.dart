import 'package:flutter/material.dart';
import 'package:my_app/Core/utils/custom_validators.dart';
import 'package:my_app/Screen/Auth/Controller/login_controller.dart';
import 'package:my_app/Screen/Auth/View/forgotpassword.dart';
import 'package:get/get.dart';
import '../../../Core/resources/colors.dart';
import '../../../Core/routes/app_pages.dart';
import '../../../Core/utils/size_config.dart';
import '../../../Core/widgets/buttons.dart';
import '../../../Core/widgets/custom_text_field.dart';
import '../Model/Request/login_params.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    Get.put(LoginController());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final loginParams = LoginParams();
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: GetBuilder<LoginController>(
            builder: (controller) {
              return Center(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(2),
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Image.asset('asset/images/dayimage.png'),
                      ),
                      SizeConfig(context).verticalSpaceMedium(),
                      CustomTextField(
                        borderRadius: BorderRadius.circular(10),
                        hint: " Email address",
                        leadingIcon: const Icon(
                          Icons.email,
                        ),
                        validator: (value) => Validator.validateEmail(value!),
                        onSaved: (value) {
                          loginParams.email = value;
                        },
                        onChanged: (value) {
                          // loginParams.email = value;
                        },
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizeConfig(context).verticalSpaceMedium(),
                      CustomTextField(
                        hint: "Password",
                        borderRadius: BorderRadius.circular(10),
                        leadingIcon: const Icon(
                          Icons.lock,
                          size: 30,
                        ),
                        keyboardType: TextInputType.visiblePassword,
                        isPasswordField: true,
                        validator: (value) =>
                            Validator.validatePassword(value!),
                        onSaved: (value) {
                          loginParams.password = value;
                        },
                        onChanged: (value) {
                          // loginParams.password = value;
                          // print(value);
                        },
                      ),
                      SizeConfig(context).verticalSpaceMedium(),
                      PrimaryButton(
                        label: "Login",
                        onPressed: () {
                          // Get.toNamed(Routes.signup);

                          final currentState = _formKey.currentState;
                          if (currentState != null) {
                            currentState.save();
                            if (currentState.validate()) {
                              Get.find<LoginController>()
                                  .requestLogin(context, loginParams);
                            }
                          }
                        },
                        width: MediaQuery.of(context).size.width * 0.9,
                        color: primarycolor,
                        icon: const Icon(Icons.refresh_sharp),
                      ),
                      SizeConfig(context).verticalSpaceMedium(),
                      InkWell(
                        onTap: () {
                          Get.toNamed(Routes.signup);
                        },
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: RichText(
                          text: TextSpan(
                            text: "Don't have an account? ",
                            style: TextStyle(
                                color: primarycolor,
                                //   color: primarycolor,,
                                fontFamily: 'Poppins',
                                fontSize: 20),
                            children: const <TextSpan>[
                              TextSpan(
                                text: "Sign Up",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}


































// import 'package:flutter/material.dart';
// import 'package:my_app/Core/utils/custom_validators.dart';
// import 'package:my_app/Screen/Auth/Controller/login_controller.dart';
// import 'package:my_app/Screen/Auth/View/forgotpassword.dart';
// import 'package:get/get.dart';
// import '../../../Core/resources/colors.dart';
// import '../../../Core/routes/app_pages.dart';
// import '../../../Core/utils/size_config.dart';
// import '../../../Core/widgets/buttons.dart';
// import '../../../Core/widgets/custom_text_field.dart';
// import '../Model/Request/login_params.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final _formKey = GlobalKey<FormState>();

//   @override
//   void initState() {
//     // TODO: implement initState
//     Get.put(LoginController());

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final loginParams = LoginParams();
//     return SafeArea(
//       child: Scaffold(
//         body: SingleChildScrollView(
//           child: GetBuilder<LoginController>(
//             builder: (controller) {
//               return Center(
//                 child: Form(
//                   key: _formKey,
//                   child: Column(
//                     children: <Widget>[
//                       Container(
//                         padding: const EdgeInsets.all(2),
//                         height: MediaQuery.of(context).size.height * 0.2,
//                         width: MediaQuery.of(context).size.width * 0.6,
//                         child: Image.asset('asset/images/dayimage.png'),
//                       ),
//                       SizeConfig(context).verticalSpaceMedium(),
//                       CustomTextField(
//                         borderRadius: BorderRadius.circular(10),
//                         hint: " Email address",
//                         leadingIcon: const Icon(
//                           Icons.email,
//                         ),
//                         validator: (value) => Validator.validateEmail(value!),
//                         onSaved: (value) {
//                           loginParams.email = value;
//                         },
//                         onChanged: (value) {
//                           // loginParams.email = value;
//                         },
//                         keyboardType: TextInputType.emailAddress,
//                       ),
//                       SizeConfig(context).verticalSpaceMedium(),
//                       CustomTextField(
//                         hint: "Password",
//                         borderRadius: BorderRadius.circular(10),
//                         leadingIcon: const Icon(
//                           Icons.lock,
//                           size: 30,
//                         ),
//                         keyboardType: TextInputType.visiblePassword,
//                         isPasswordField: true,
//                         validator: (value) =>
//                             Validator.validatePassword(value!),
//                         onSaved: (value) {
//                           loginParams.password = value;
//                         },
//                         onChanged: (value) {
//                           // loginParams.password = value;
//                           // print(value);
//                         },
//                       ),
//                       SizeConfig(context).verticalSpaceMedium(),
//                       PrimaryButton(
//                         label: "Login",
//                         onPressed: () {
//                           // Get.toNamed(Routes.signup);

//                           final currentState = _formKey.currentState;
//                           if (currentState != null) {
//                             currentState.save();
//                             if (currentState.validate()) {
//                               Get.find<LoginController>()
//                                   .requestLogin(context, loginParams);
//                             }
//                           }
//                         },
//                         width: MediaQuery.of(context).size.width * 0.9,
//                         color: primarycolor,
//                         icon: const Icon(Icons.refresh_sharp),
//                       ),
//                       const SizedBox(height: 12),
//                       // ElevatedButton(
//                       //   onPressed: () {
//                       //     Navigator.of(context).push(
//                       //       MaterialPageRoute(
//                       //         builder: (BuildContext context) {
//                       //           return const Forgetpassword();
//                       //         },
//                       //       ),
//                       //     );
//                       //   },
//                       //   style: ElevatedButton.styleFrom(
//                       //     backgroundColor: Colors.transparent,
//                       //     shadowColor: Colors.transparent,
//                       //   ),
//                       //   child: Text(
//                       //     'Forgot Password?',
//                       //     style: TextStyle(
//                       //       fontSize: 20,
//                       //       fontFamily: 'Poppins',
//                       //       //   color: primarycolor,,
//                       //       color: primarycolor,
//                       //     ),
//                       //   ),
//                       // ),
//                       // SizedBox(
//                       //   height: MediaQuery.of(context).size.height * 0.02,
//                       // ),
//                       // Text(
//                       //   '----------- OR -----------',
//                       //   style: TextStyle(
//                       //     fontSize: 18,
//                       //     fontFamily: 'Poppins',
//                       //     fontWeight: FontWeight.bold,
//                       //     color: primarycolor,
//                       //   ),
//                       // ),
//                       // SizedBox(
//                       //   height: MediaQuery.of(context).size.height * 0.01,
//                       // ),
//                       // PrimaryOutlineButton(
//                       //   title: 'Login with Google',
//                       //   onPressed: () {},
//                       //   icon: const Icon(Icons.golf_course),
//                       //   width: MediaQuery.of(context).size.width * 0.7,
//                       //   height: 40,
//                       //   image: 'asset/images/google.png',
//                       // ),
//                       const SizedBox(height: 15),
//                       InkWell(
//                         onTap: () {
//                           Get.toNamed(Routes.signup);
//                         },
//                         splashColor: Colors.transparent,
//                         highlightColor: Colors.transparent,
//                         child: RichText(
//                           text: TextSpan(
//                             text: "Don't have an account? ",
//                             style: TextStyle(
//                                 color: primarycolor,
//                                 //   color: primarycolor,,
//                                 fontFamily: 'Poppins',
//                                 fontSize: 20),
//                             children: const <TextSpan>[
//                               TextSpan(
//                                 text: "Sign Up",
//                                 style: TextStyle(
//                                   fontFamily: 'Poppins',
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 20,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
