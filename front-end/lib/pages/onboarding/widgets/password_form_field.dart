import 'package:flutter/material.dart';
import 'package:idosotech/pages/onboarding/widgets/custom_text_form_field.dart';



class PasswordFormField extends StatefulWidget {
  final TextEditingController? controller;
  final EdgeInsetsGeometry? padding;
  final String? hintText;
  final String? labelText;

  const PasswordFormField({super.key, this.controller,
  this.padding, this.hintText, this.labelText});

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      textEditingController: widget.controller,
      varPadding: widget.padding,
      hintText: widget.hintText,
      labelText: widget.labelText,
      su
    );
  }
}
