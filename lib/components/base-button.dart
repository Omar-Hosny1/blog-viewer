import 'package:blog_viewer/utils/colors.dart';
import 'package:flutter/material.dart';

enum ButtonStyleVariants { normal, outline }

class BaseButton extends StatelessWidget {
  const BaseButton({
    super.key,
    this.styleVariants = ButtonStyleVariants.normal,
    required this.onClick,
    this.icon,
    this.imagePath,
    required this.label,
    this.padding,
    this.withIcon = true,
  });

  final ButtonStyleVariants styleVariants;
  final void Function()? onClick;
  final Icon? icon;
  final String? imagePath;
  final String label;
  final MaterialStateProperty<EdgeInsetsGeometry?>? padding;
  final bool? withIcon;

  @override
  Widget build(BuildContext context) {
    if (withIcon == true) {
      return ElevatedButton.icon(
        style: ButtonStyle(
          padding: padding ??
              MaterialStateProperty.all(
                EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              ),
          backgroundColor: MaterialStateProperty.all<Color>(
            styleVariants == ButtonStyleVariants.normal
                ? SecondaryColor
                : styleVariants == ButtonStyleVariants.outline
                    ? Colors.transparent
                    : SecondaryColor,
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
                side: BorderSide(
                  color: SecondaryColor,
                )),
          ),
        ),
        onPressed: onClick,
        icon: icon ??
            Image.asset(
              imagePath ?? 'assets/icons/thunder.png',
              height: 30,
            ),
        label: Text(label),
      );
    }
    return ElevatedButton(
      style: ButtonStyle(
        padding: padding ??
            MaterialStateProperty.all(
              EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
            ),
        backgroundColor: MaterialStateProperty.all<Color>(
          styleVariants == ButtonStyleVariants.normal
              ? SecondaryColor
              : styleVariants == ButtonStyleVariants.outline
                  ? Colors.transparent
                  : SecondaryColor,
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
              side: BorderSide(
                color: SecondaryColor,
              )),
        ),
      ),
      child: Text(label),
      onPressed: onClick,
    );
  }
}
