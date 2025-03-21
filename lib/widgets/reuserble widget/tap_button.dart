import 'package:flutter/material.dart';

class TapButton extends StatefulWidget {
  final String lable;
  final VoidCallback onPressed;
  final Color btnColor;
  const TapButton(
      {
        super.key,
        required this.lable,
        required this.onPressed,
        required this.btnColor,
      }
      );

  @override
  State<TapButton> createState() => _TapButtonState();
}

class _TapButtonState extends State<TapButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: widget.btnColor
        ),
        child: ElevatedButton(
            onPressed: widget.onPressed,
            child: Text(widget.lable,style: TextStyle(fontWeight: FontWeight.w700,fontSize:20)),
        ),
      ),
    );
  }
}
