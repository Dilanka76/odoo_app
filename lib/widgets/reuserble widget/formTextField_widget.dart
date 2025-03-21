
import 'package:flutter/material.dart';

class FormTextField extends StatefulWidget {
  final String lable;
  final TextEditingController controller;
  final FormTextFieldType type;

   const FormTextField({
    super.key,
    required this.lable,
    required this.controller,
    required this.type,
  });

  @override
  State<FormTextField> createState() => _FormTextFieldState();
}
class _FormTextFieldState extends State<FormTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: setKeybordType(widget.type),
      obscureText: widget.type == FormTextFieldType.password ? true :false,
      decoration: InputDecoration(
        hintText: widget.lable,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15)
        )
      ),
    );
  }

  setKeybordType(FormTextFieldType type){
    if(type == FormTextFieldType.text){
      return TextInputType.text;
    }
    else if(type == FormTextFieldType.password){
      return TextInputType.visiblePassword;
    }
  }
}
enum FormTextFieldType {
  text,password,
}
