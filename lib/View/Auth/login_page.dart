import 'package:flutter/material.dart';
import 'package:my_app/View/Payment/amount_received.dart';
import 'package:my_app/View/Auth/forgotpassword.dart';
import 'package:get/get.dart';
import '../../utils/app_pages.dart';
import '../../utils/constants.dart';
import '../../widgets/buttons.dart';
import '../../widgets/custom_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(2),
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Image.asset('asset/images/dayimage.png'),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                CustomTextField(
                  borderRadius: BorderRadius.circular(10),
                  hint: "Enter Email",
                  leadingIcon: const Icon(
                    Icons.email,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  //  controller : _emailController
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                CustomTextField(
                  hint: "Password",
                  borderRadius: BorderRadius.circular(10),
                  leadingIcon: const Icon(
                    Icons.lock,
                    size: 30,
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  isPasswordField: true,
                  //  controller : _emailController
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                PrimaryButton(
                  label: "Login",
                  onPressed: () {
                    Get.toNamed(Routes.overview);
                  },
                  width: MediaQuery.of(context).size.width * 0.9,
                  color: const Color.fromRGBO(49, 26, 187, 1),
                  icon: const Icon(Icons.refresh_sharp),
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return const Forgetpassword();
                        },
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                  ),
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      //   color: primarycolor,,
                      color: primarycolor,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Text(
                  '----------- OR -----------',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    color: primarycolor,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                PrimaryOutlineButton(
                  title: 'Login with Google',
                  onPressed: () {},
                  icon: const Icon(Icons.golf_course),
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: 40,
                  image: 'asset/images/google.png',
                ),
                const SizedBox(height: 15),
                InkWell(
                  onTap: () {
                    Get.toNamed(Routes.signup);
                  },
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: RichText(
                    text: TextSpan(
                      text: "Dont't have an account? ",
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
        ),
      ),
    );
  }
}
