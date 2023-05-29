import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final TextInputType? keyboardType;
  final bool isPasswordField;
  // final bool autofocus;
  final Widget? leadingIcon;
  final String title;
  // final FormFieldValidator? validator;
  final BorderRadius borderRadius;

  CustomTextField({
    super.key,
    this.title = "",
    this.hint = "",
    this.keyboardType,
    this.borderRadius = const BorderRadius.all(Radius.circular(20)),
    // this.validator,
    this.isPasswordField = false,
    // this.autofocus = false,
    this.leadingIcon,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obsecured = true;
  toggle() {
    obsecured = !obsecured;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: TextFormField(
        keyboardType: widget.keyboardType,
        // controller: widget.controller,
        // validator: widget.validator,
        obscureText: widget.isPasswordField ? obsecured : false,

        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: widget.borderRadius),
          fillColor: const Color.fromARGB(255, 221, 239, 248),
          filled: true,
          prefixIcon: widget.leadingIcon,
          prefixIconColor: const Color.fromRGBO(49, 26, 187, 1),

          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: widget.borderRadius,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: widget.borderRadius,
          ),

          suffixIcon: widget.isPasswordField
              ? IconButton(
                  onPressed: () {
                    toggle();
                  },
                  icon: Icon(
                    obsecured ? Icons.visibility_off : Icons.visibility,
                    color: Color.fromARGB(255, 128, 183, 247),
                  ),
                )
              : null,
          hintText: widget.hint,
          // label: Text(title),
        ),
      ),
    );
  }
}

// OutlineInputBorder border({Color? color, double radius = 360}) {
//   return OutlineInputBorder(
//     borderRadius: BorderRadius.circular(radius),
//     borderSide: BorderSide(
//       color: color ?? Color.fromARGB(255, 236, 4, 4),
//     ),
//   );
// }
