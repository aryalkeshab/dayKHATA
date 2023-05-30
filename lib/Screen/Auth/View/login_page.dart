import 'package:flutter/material.dart';
import 'package:my_app/Core/utils/custom_validators.dart';
import 'package:my_app/Screen/Auth/Controller/login_controller.dart';
import 'package:my_app/Screen/Auth/View/forgotpassword.dart';
import 'package:get/get.dart';
import '../../../Core/routes/app_pages.dart';
import '../../../Core/utils/constants.dart';
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
  LoginController controller = Get.put(LoginController());
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
                        hint: " Enter Email",
                        leadingIcon: const Icon(
                          Icons.email,
                        ),
                        validator: (value) => Validator.validateEmail(value!),
                        onSaved: (value) {
                          // loginParams.email = value;
                        },
                        onChanged: (value) {
                          loginParams.email = value;
                        },
                        keyboardType: TextInputType.emailAddress,
                        controller: controller.emailController,
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
                        validator: (value) => Validator.validatePassword(value!),
                        onSaved: (value) {
                          // loginParams.password = value;
                        },
                        onChanged: (value) {
                          loginParams.password = value;
                          print(value);
                        },
                        controller: controller.passwordController,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
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
                            controller.passwordController.clear();
                          }
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
              );
            },
          ),
        ),
      ),
    );
  }
}
