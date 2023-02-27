import 'package:flutter/material.dart';
import 'package:oivan_app/src/utils/ui/my_colors.dart';

class CustomBaseText extends StatelessWidget {
  final double? fontSize, letterSpacing;
  final FontWeight? fontWeight;
  final Color? color;
  const CustomBaseText({
    super.key,
    required this.title, this.fontSize = 16, this.letterSpacing = 2.016, this.fontWeight = FontWeight.w700, this.color = MyColors.whiteColor,
  });

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title ?? "StackOverFlow Users",
      style:  TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        letterSpacing: letterSpacing,
      ),
    );
  }
}
