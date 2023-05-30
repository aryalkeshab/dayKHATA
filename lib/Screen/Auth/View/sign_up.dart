import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/Screen/Auth/Model/Request/register_params.dart';
import '../../../Core/routes/app_pages.dart';
import '../../../Core/utils/constants.dart';
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
    // TODO: implement initState
    Get.put(RegisterController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final registerParams = RegisterParams();
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Form(
              key: _registerFormKey,
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
                  onSaved: (value) {},
                  //  controller : _emailController
                  onChanged: (value) {
                    registerParams.name = value;
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                const CustomTextField(
                  // borderRadius: BorderRadius.circular(20),
                  hint: "Last Name",
                  leadingIcon: Icon(
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
                  // validator: ,
                  onSaved: (value) {},
                  onChanged: (value) {
                    registerParams.email = value;
                  },
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
                  onChanged: (value) {
                    registerParams.password = value;
                  },
                  //  controller : _emailController
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                PrimaryButton(
                  label: "Sign Up",
                  onPressed: () {
                    Get.toNamed(Routes.login);
                    // final currentState = _registerFormKey.currentState;
                    // if (currentState != null) {
                    //   currentState.save();
                    //   if (currentState.validate()) {
                    //     Get.find<RegisterController>()
                    //         .requestRegister(context, registerParams);
                    //   }
                    // }
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
            ),
          ),
        ),
      ),
    );
  }
}
