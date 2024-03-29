import 'package:flutter/material.dart';

import '../resources/colors.dart';

class CustomLoadingDialog extends StatelessWidget {
  final double? width;
  final bool backgroundColor;
  final bool radius;

  const CustomLoadingDialog(
      {this.width, this.backgroundColor = true, this.radius = true});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: width ?? 120,
            decoration: BoxDecoration(
              color: backgroundColor ? Colors.white.withOpacity(0.6) : null,
              borderRadius: radius ? BorderRadius.circular(8) : null,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: CircularProgressIndicator(
                    backgroundColor: primarycolor,
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      Color.fromARGB(255, 6, 173, 228), //<-- SEE HERE
                    ),
                  ),
                ),
              ],
              // children: <Widget>[Lottie.asset('assets/anim/loading_anim.json')],
            ),
          ),
        ],
      ),
    );
  }
}

void showLoadingDialog(BuildContext context, {Widget? loadingWidget}) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) =>
        loadingWidget ?? const CustomLoadingDialog(),
  );
}

void hideLoadingDialog(BuildContext context) {
  Navigator.of(context).pop();
}

// void hideLoadingDialog(BuildContext context, {Widget? loadingWidget}) {
//   Navigator.of(context).pop(loadingWidget ?? const CustomLoadingDialog());
// }
