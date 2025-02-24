import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:idosotech/constantes/app_colors.dart';
import 'package:idosotech/constantes/app_text_style.dart';
import 'package:idosotech/pages/onboarding/widgets/botao_primario.dart';
import 'package:idosotech/pages/onboarding/widgets/multi_text_button.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Align(
          child: Column(
            children: [
              SizedBox(
                // child: Text('data'),
                height: 60,
              ),
              Expanded(
                  flex: 2,
                  child:
                  Container(
                    // color: AppColors.appPrimaryColor,
                    child: Image.asset('assets/images/velho_no_bg.png'),
                  )),

              Text('Você conectado ',style: AppTextStyles.mediumText.copyWith(color: AppColors.appPrimaryColor),),

              Text(' a tecnologia', style: AppTextStyles.mediumText.copyWith(color: AppColors.appPrimaryColor),),

              
              Padding(padding:
              EdgeInsets.all(16.0),
                child: BotaoPrimario(
                  text: 'Get Started',
                  onPressed: () {},
                ),
              ),

              // SizedBox(height: 16,),


              // ElevatedButton(onPressed: () {}, child:
              // Text("Registre-se"),),

              CustomTextButton(
                onPressed: () => log('tap teste'),
                textList: [
                  Text('Já tem uma conta? ', style: AppTextStyles.smallText,),
                  Text('Clique aqui', style: AppTextStyles.smallTextStrong.copyWith(color: AppColors.appPrimaryColor),)
                ]
                 ),

              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
    );
  }
}

