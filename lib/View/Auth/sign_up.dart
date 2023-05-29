import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/app_pages.dart';
import '../../utils/constants.dart';
import '../../widgets/buttons.dart';
import '../../widgets/custom_text_field.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(children: <Widget>[
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
                hint: "First Name",
                leadingIcon: const Icon(
                  Icons.person,
                ),
                keyboardType: TextInputType.text,
                //  controller : _emailController
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              CustomTextField(
                // borderRadius: BorderRadius.circular(20),
                hint: "Last Name",
                leadingIcon: const Icon(
                  Icons.person,
                ),
                keyboardType: TextInputType.name,
                //  controller : _emailController
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              CustomTextField(
                hint: "Email Address",
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
                hint: "New Password",
                isPasswordField: true,
                leadingIcon: const Icon(
                  Icons.lock,
                ),
                keyboardType: TextInputType.visiblePassword,
                //  controller : _emailController
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              PrimaryButton(
                label: "Sign Up",
                onPressed: () {
                  Get.toNamed(Routes.login);
                },
                width: MediaQuery.of(context).size.width * 0.9,
                color: const Color.fromRGBO(49, 26, 187, 1),
                icon: const Icon(Icons.arrow_forward),
              ),
              const SizedBox(height: 15),
              InkWell(
                onTap: () {
                  Get.toNamed(Routes.login);
                },
                child: RichText(
                  text: TextSpan(
                    text: "Already have an account? ",
                    style: TextStyle(
                        color: primarycolor,
                        fontFamily: 'Poppins',
                        fontSize: 20),
                    children: const <TextSpan>[
                      TextSpan(
                        text: "login",
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
            ]),
          ),
        ),
      ),
    );
  }
}
