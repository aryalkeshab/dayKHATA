import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/View/Auth/login_page.dart';
import 'package:my_app/View/Auth/verificationpage.dart';

import '../../utils/app_pages.dart';
import '../../utils/constants.dart';
import '../../widgets/buttons.dart';
import '../../widgets/custom_text_field.dart';

class Forgetpassword extends StatelessWidget {
  const Forgetpassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const SizedBox(width: 10),
                SizedBox(
                  width: 40,
                  height: 40,
                  child: FloatingActionButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return const LoginPage();
                      }));
                    },
                    backgroundColor: const Color.fromRGBO(49, 26, 187, 1),
                    child: const Icon(Icons.arrow_back),
                  ),
                ),
                const SizedBox(width: 18),
                Text(
                  'Forgot Password',
                  style: TextStyle(
                      fontSize: 25,
                      color: primarycolor,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 25),
            Container(
              height: 180,
              width: 180,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(49, 26, 187, 1),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(100),
              ),
              child: const Icon(
                Icons.lock_outline,
                size: 110,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Text(
                'Please Enter Your Email Address To Receive a Verification Code.',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  color: primarycolor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              hint: "Email Address",
              leadingIcon: const Icon(
                Icons.email,
              ),
              keyboardType: TextInputType.emailAddress,
              //  controller : _emailController
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: PrimaryButton(
                label: "Send",
                onPressed: () {
                  Get.toNamed(Routes.verify);
                },
                width: MediaQuery.of(context).size.width * 0.9,
                color: const Color.fromRGBO(49, 26, 187, 1),
                icon: const Icon(Icons.arrow_forward),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
