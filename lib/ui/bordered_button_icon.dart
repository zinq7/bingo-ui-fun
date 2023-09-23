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
    this.backgroundColor = const Color.fromARGB(255, 100, 100, 100),
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
        boxShadow: const [
          BoxShadow(
            blurRadius: 5,
            offset: Offset(2, 2),
            color: Colors.black,
          )
        ],
        border: Border.all(
          color: borderColor,
          width: borderWidth,
        ),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: style,
      ),
    );
  }
}
