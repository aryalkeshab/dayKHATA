import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Core/routes/app_pages.dart';
import '../../../Core/utils/constants.dart';
import '../../../Core/widgets/buttons.dart';
import '../../../Core/widgets/custom_text_field.dart';
import 'verificationpage.dart';

class Newpassword extends StatelessWidget {
  const Newpassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
              const SizedBox(width: 10),
              SizedBox(
                width: 40,
                height: 40,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (BuildContext context) {
                        return const Verificationpage();
                      }),
                    );
                  },
                  backgroundColor: primarycolor,
                  child: const Icon(Icons.arrow_back),
                ),
              ),
              const SizedBox(width: 15),
              Text(
                'New Password',
                style: TextStyle(
                    fontSize: 25,
                    color: primarycolor,
                    fontWeight: FontWeight.bold),
              ),
            ]),
            const SizedBox(height: 25),
            Container(
              height: 180,
              width: 180,
              decoration: BoxDecoration(
                color: primarycolor,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(100),
              ),
              child: const Icon(
                Icons.lock_open_outlined,
                size: 110,
                color: Colors.white,
              ),
            ),
            // config.verticalSpaceSmall(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Text(
                'Your new password must be different from your old password',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  color: primarycolor,
                ),
                textAlign: TextAlign.center,
              ),
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
            const SizedBox(height: 15),
            CustomTextField(
              hint: "Confirm Password",
              isPasswordField: true,
              leadingIcon: const Icon(
                Icons.lock,
              ),
              keyboardType: TextInputType.visiblePassword,
              //  controller : _emailController
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: PrimaryButton(
                label: "Change",
                onPressed: () {
                  Get.toNamed(Routes.login);
                },
                width: MediaQuery.of(context).size.width * 0.9,
                color: primarycolor,
                icon: const Icon(Icons.arrow_forward),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
