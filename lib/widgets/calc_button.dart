import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  final Color bgColor;
  final bool big;
  final String text;
  final Function? onPressed;
  
  const CalcButton({
    super.key, 
    bgColor,
    this.big = false, 
    required this.text, 
    this.onPressed,
  }): bgColor = bgColor ?? const Color(0xff333333);

  @override
  Widget build(BuildContext context) {
    final buttonStyle = TextButton.styleFrom(
        backgroundColor: bgColor,
        shape: const StadiumBorder(),
        textStyle: const TextStyle(color: Colors.white)
    );

    return Container(
      margin: const EdgeInsets.only( bottom: 10, right: 5, left: 5 ),
      child: TextButton(
        style: buttonStyle,
        onPressed: onPressed == null ? null : () => onPressed!(),
        child: Container(
          width: big ? 150 : 55,
          height: 55,
          child: Center(
            child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w300))
          ),
        )
      ),
    );
  }
}