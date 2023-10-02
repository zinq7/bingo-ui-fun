import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class BorderedButtonIcon extends StatelessWidget {
  final double borderWidth;
  final Color backgroundColor, borderColor;
  final Material? defaultMatValues;
  final String text;
  final double? width, height;
  final TextStyle? style;

  const BorderedButtonIcon(
    this.text, {
    super.key,
    this.borderWidth = 4,
    this.backgroundColor = const Color.fromARGB(199, 25, 22, 31),
    this.borderColor = const Color.fromARGB(255, 0, 0, 0),
    this.style,
    this.defaultMatValues,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(32)),
        boxShadow: const [
          BoxShadow(
            blurRadius: 5,
            offset: Offset(2, 2),
            color: Color.fromARGB(108, 0, 0, 0),
          )
        ],
        border: Border.all(
          color: borderColor,
          width: borderWidth,
        ),
      ),
      child: AutoSizeText(
        text,
        maxLines: 1,
        textAlign: TextAlign.center,
        style: style,
      ),
    );
  }
}
