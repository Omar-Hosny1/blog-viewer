import 'package:blog_viewer/utils/colors.dart';
import 'package:blog_viewer/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
    required this.text,
    this.withDivider,
    this.withCopy,
    this.copyColor,
    this.dividerColor,
    this.dividerHeight,
    this.dividerWidth,
    this.textStyle,
  });

  final bool? withDivider;
  final Color? dividerColor;
  final double? dividerWidth;
  final double? dividerHeight;
  final bool? withCopy;
  final TextStyle? textStyle;
  final Color? copyColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (withDivider == true)
          Container(
            height: dividerHeight ?? 50,
            color: dividerColor ?? SecondaryColor,
            width: dividerWidth ?? 3,
            margin: EdgeInsets.only(
              right: 10,
            ),
          ),
        Flexible(
          child: Text(
            text,
            style: textStyle ??
                TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: SecondaryColor,
                ),
          ),
        ),
        if (withCopy == true)
          Column(
            children: [
              InkWell(
                onTap: () async {
                  await Clipboard.setData(ClipboardData(text: text));
                  showSnackbar(
                    SnackbarState.success,
                    'Copied!',
                    'Text Coppied Successfuly',
                  );
                },
                child: Container(
                  width: 20,
                  child: Image.asset(
                    'assets/icons/copy.png',
                    color: copyColor,
                  ),
                ),
              ),
              Container(
                height: 30,
              )
            ],
          ),
      ],
    );
  }
}
