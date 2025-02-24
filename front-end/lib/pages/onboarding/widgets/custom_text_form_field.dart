import 'package:flutter/material.dart';

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

  const CustomTextFormField({
    super.key,
    this.varPadding,
    this.hintText,
    this.labelText,
    this.textCapitalization,
    this.textEditingController,
    this.keybordType,
    this.textInputAction,
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
        textInputAction: widget.textInputAction,
        keyboardType: widget.keybordType,
        controller: widget.textEditingController,
        textCapitalization: widget.textCapitalization?? TextCapitalization.none,
        decoration: InputDecoration(

          // hintText: 'Ola',
          labelText: "Seu nome".toUpperCase(),
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
