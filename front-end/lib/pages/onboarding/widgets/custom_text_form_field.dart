import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../constantes/app_colors.dart';
import '../../../constantes/app_text_style.dart';

class CustomTextFormField extends StatefulWidget {
  final EdgeInsetsGeometry? varPadding;
  final String? hintText;
  final String? labelText;
  final TextCapitalization?  textCapitalization;
  final TextEditingController? textEditingController;
  final TextInputType? keybordType;
  final TextInputAction? textInputAction;
  final Widget? suffixIcon;
  final bool? obscureText;
  final List<TextInputFormatter>? inputFormaters;
  final String? Function(String?)? validator;

  const CustomTextFormField({
    super.key,
    this.varPadding,
    this.hintText,
    this.labelText,
    this.textCapitalization,
    this.textEditingController,
    this.keybordType,
    this.textInputAction,
    this.suffixIcon,
    this.obscureText,
    this.inputFormaters,
    this.validator
  });


  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {



  final defaultBorder = OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.appPrimaryColor,)
  );


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.varPadding ?? EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: TextFormField(
        style: AppTextStyles.inputText.copyWith(color: AppColors.appPrimaryColor),
        inputFormatters: widget.inputFormaters,
        obscureText: widget.obscureText?? false,
        textInputAction: widget.textInputAction,
        keyboardType: widget.keybordType,
        controller: widget.textEditingController,
        textCapitalization: widget.textCapitalization?? TextCapitalization.none,
        decoration: InputDecoration(

          suffixIcon: widget.suffixIcon,
          hintText: widget.hintText?.toLowerCase(),
          labelText: widget.labelText?.toUpperCase(),
          labelStyle: AppTextStyles.inputLabelText.copyWith(color: AppColors.appDarkGrey),
          floatingLabelBehavior:  FloatingLabelBehavior.always,
          // focusedBorder: Outlin,
          border: defaultBorder,
          focusedBorder: defaultBorder,
          errorBorder: defaultBorder,
          focusedErrorBorder: defaultBorder,
          disabledBorder: defaultBorder,
        ),
      ),
    );
  }
}
