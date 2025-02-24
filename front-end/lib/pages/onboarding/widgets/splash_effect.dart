import 'package:flutter/material.dart';
import 'package:idosotech/constantes/app_text_style.dart';

import '../../../constantes/app_colors.dart';


class SplashEffect extends StatelessWidget {
  const SplashEffect({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: 
          LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.appPrimaryColor,
              AppColors.appSecondaryColor,
            ],
          ),
      ),
      
      child: Text('idoso tech',
      style: AppTextStyles.bigText.copyWith(color: AppColors.appWhiteColor),
      ),
    );
  }
}
