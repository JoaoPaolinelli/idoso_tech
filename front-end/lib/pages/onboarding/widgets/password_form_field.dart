import 'dart:math';

import 'package:flutter/material.dart';
import 'package:idosotech/pages/onboarding/widgets/custom_text_form_field.dart';



class PasswordFormField extends StatefulWidget {
  final TextEditingController? controller;
  final EdgeInsetsGeometry? padding;
  final String? hintText;
  final String? labelText;
  // final Widget? suffixIcon;

  const PasswordFormField({super.key, this.controller,
  this.padding, this.hintText, this.labelText, //
  // this.suffixIcon
  });

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      obscureText: isHidden,
      textEditingController: widget.controller,
      varPadding: widget.padding,
      hintText: widget.hintText,
      labelText: widget.labelText,
      suffixIcon: InkWell(
        borderRadius: BorderRadius.circular(23),
          onTap: () {
            setState(() {
              isHidden = !isHidden;
            });
            print('woorks');
          },
          child: isHidden ? Icon(Icons.visibility) : Icon(Icons.visibility_off))

    );
  }
}
