import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/Core/utils/custom_validators.dart';
import 'package:my_app/Screen/Auth/Model/Request/register_params.dart';
import '../../../Core/resources/colors.dart';
import '../../../Core/routes/app_pages.dart';
import '../../../Core/utils/size_config.dart';
import '../../../Core/widgets/buttons.dart';
import '../../../Core/widgets/custom_text_field.dart';
import '../Controller/register_controller.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _registerFormKey = GlobalKey<FormState>();
  @override
  void initState() {
    Get.put(RegisterController());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final registerParams = RegisterParams();

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: GetBuilder<RegisterController>(builder: (controller) {
              return Form(
                key: _registerFormKey,
                child: Column(children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(2),
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Image.asset('asset/images/dayimage.png'),
                  ),
                  // SizedBox(
                  //   height: MediaQuery.of(context).size.height * 0.03,
                  // ),
                  CustomTextField(
                    hint: "First Name",
                    leadingIcon: const Icon(
                      Icons.person,
                    ),
                    validator: (value) => Validator.validateName(value!),
                    keyboardType: TextInputType.text,
                    onSaved: (value) {
                      registerParams.name = value;
                    },
                    //  controller : _emailController
                    onChanged: (value) {
                      // registerParams.name = value;
                    },
                  ),

                  SizeConfig(context).verticalSpaceMedium(),
                  // SizedBox(
                  //   height: MediaQuery.of(context).size.height * 0.02,
                  // ),
                  CustomTextField(
                    hint: "Email address",
                    leadingIcon: const Icon(
                      Icons.email,
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) => Validator.validateEmail(value!),
                    onSaved: (value) {
                      registerParams.email = value;
                    },
                    onChanged: (value) {
                      // registerParams.email = value;
                    },
                  ),
                  SizeConfig(context).verticalSpaceMedium(),
                  CustomTextField(
                    hint: "New Password",
                    isPasswordField: true,
                    leadingIcon: const Icon(
                      Icons.lock,
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    validator: (value) => Validator.validatePassword(value!),
                    onSaved: (value) {
                      registerParams.password = value;
                    },
                    onChanged: (value) {
                      // registerParams.password = value;
                    },
                    //  controller : _emailController
                  ),
                  SizeConfig(context).verticalSpaceMedium(),
                  PrimaryButton(
                    label: "Sign Up",
                    onPressed: () {
                      final currentState = _registerFormKey.currentState;
                      if (currentState != null) {
                        currentState.save();
                        if (currentState.validate()) {
                          Get.find<RegisterController>()
                              .requestRegister(context, registerParams);
                        }
                      }
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
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
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
              );
            }),
          ),
        ),
      ),
    );
  }
}
