import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import '../../utils/app_pages.dart';
import '../../utils/constants.dart';
import '../../widgets/buttons.dart';

class Verificationpage extends StatefulWidget {
  const Verificationpage({Key? key}) : super(key: key);

  @override
  State<Verificationpage> createState() => _VerificationpageState();
}

class _VerificationpageState extends State<Verificationpage> {
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(234, 239, 243, 1),
        border: Border.all(color: primarycolor
            // color: Color.fromARGB(255, 2, 134, 241),
            ),
        borderRadius: BorderRadius.circular(50),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(
        color: Color.fromARGB(255, 2, 134, 241),
      ),
      borderRadius: BorderRadius.circular(50),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Verification',
            style: TextStyle(
              color: primarycolor,
            ),
          ),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: primarycolor,
              ),
              child: InkWell(
                onTap: () {
                  Get.toNamed(Routes.login);
                },
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 20),

              // Row(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     children: <Widget>[
              //       const SizedBox(width: 10),
              //       SizedBox(
              //         width: 40,
              //         height: 40,
              //         child: FloatingActionButton(
              //           onPressed: () {
              //             Navigator.of(context).push(MaterialPageRoute(
              //                 builder: (BuildContext context) {
              //               return const Forgetpassword();
              //             }));
              //           },
              //           backgroundColor: const Color.fromRGBO(49, 26, 187, 1),
              //           child: const Icon(Icons.arrow_back),
              //         ),
              //       ),
              //       const Text(
              //         'Verification',
              //         textAlign: TextAlign.center,
              //         style: TextStyle(
              //           fontSize: 20,
              //           fontWeight: FontWeight.w600,
              //             color: primarycolor,,
              //         ),
              //       ),
              //     ]),
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
                  Icons.mark_email_read_outlined,
                  size: 110,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 25),
              SizedBox(
                // width: 320,
                child: Text(
                  'Enter the 4 digits code that is sent to Your Email Address',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 19,
                    color: primarycolor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),

              Pinput(
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusedPinTheme,
                submittedPinTheme: submittedPinTheme,
                keyboardType: TextInputType.number,
                // validator: (s) {
                //    return s == '2222' ? null : 'Pin is incorrect';
                // },
                length: 4,
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                showCursor: true,
                // onCompleted: (pin) => print(pin),
              ),

              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                child: Text(
                  'Resend New Code',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    color: primarycolor,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: PrimaryButton(
                  label: "Verify",
                  onPressed: () {
                    Get.toNamed(Routes.setnewpassword);
                  },
                  width: MediaQuery.of(context).size.width * 0.8,
                  color: const Color.fromRGBO(49, 26, 187, 1),
                  icon: const Icon(Icons.arrow_forward),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
