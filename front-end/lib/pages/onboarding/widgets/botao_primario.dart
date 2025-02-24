import 'package:flutter/material.dart';

import '../../../constantes/app_colors.dart';
import '../../../constantes/app_text_style.dart';

class BotaoPrimario extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;

  BotaoPrimario({
    super.key,
    this.onPressed,
    required this.text,
  });

  final BorderRadius _borderRadius = BorderRadius.all(Radius.circular(24.0));

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Ink(
        height: 48.0,
        // width: 400.0,

        decoration: BoxDecoration(
            borderRadius: _borderRadius,
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.appPrimaryColor,
                  AppColors.appSecondaryColor,
                ]
            )
        ),
        child: InkWell(
          borderRadius: _borderRadius,
          onTap: onPressed,
          child: Align(
            child: Text(text, style: AppTextStyles.buttonTextStyle.copyWith(
                color: AppColors.appWhiteColor),),
          ),
        ),

      ),

    );
  }
}