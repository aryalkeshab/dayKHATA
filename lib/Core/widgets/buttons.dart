import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final double? height;
  final double? width;
  final Color? color;
  final VoidCallback onPressed;

  final Icon? icon;

  const PrimaryButton({
    Key? key,
    required this.label,
    this.height,
    this.width,
    this.color,
    required this.onPressed,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        minimumSize: Size(width ?? 200, height ?? 50),
        backgroundColor: color,
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label),
          const SizedBox(
            width: 5,
          ),
          if (icon != null) icon!,
        ],
      ),
    );
  }
}

class PrimaryOutlineButton extends StatelessWidget {
  double? width;
  double? height;
  Color? borderColor;
  Function onPressed;
  double? radius;
  Widget? loadingWidget;
  String title;
  Color? titleColor;
  Widget? icon;
  Color? iconColor;
  double? iconSize;
  String? image;
  Widget? child;

  PrimaryOutlineButton({
    super.key,
    this.width,
    this.height,
    this.borderColor,
    this.radius,
    this.titleColor,
    this.icon,
    this.iconSize,
    required this.title,
    required this.onPressed,
    this.loadingWidget,
    this.image,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        elevation: 0,
        minimumSize: Size(width ?? 40, height ?? 50),
        side: BorderSide(
            width: 1,
            color: borderColor ?? const Color.fromRGBO(49, 26, 187, 1),
            style: BorderStyle.solid),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(radius ?? 5),
          ),
        ),
      ),
      onPressed: onPressed(),
      child: loadingWidget ??
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (image != null)
                Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: SizedBox(
                    child: Image.asset(
                      image!,
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),
              // if (icon != null)
              //   Padding(
              //     padding: EdgeInsets.only(right: 8),
              //     child: SizedBox(
              //       width: iconSize ?? 15,
              //       child: icon,
              //     ),
              //   ),
              Text(
                title,
                style: TextStyle(
                  color: titleColor ?? const Color.fromRGBO(49, 26, 187, 1),
                ),
              )
            ],
          ),
    );
  }
}
