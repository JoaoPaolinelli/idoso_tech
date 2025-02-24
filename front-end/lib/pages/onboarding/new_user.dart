import 'package:flutter/material.dart';
import 'package:idosotech/constantes/app_colors.dart';
import 'package:idosotech/pages/onboarding/widgets/botao_primario.dart';
import 'package:idosotech/pages/onboarding/widgets/custom_text_form_field.dart';

import '../../constantes/app_text_style.dart';

class NewUser extends StatelessWidget {
  const NewUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Align(
        child: Column(
          children: [

            SizedBox(height: 20,),
            Text('Registre-se ',style: AppTextStyles.mediumText.copyWith(color: AppColors.appPrimaryColor),),
            SizedBox(height: 20,),

            // Text('Tecnologia', style: AppTextStyles.mediumText.copyWith(color: AppColors.appPrimaryColor),),
            Expanded(

              flex: 1,
                child: Container(
                  // color: AppColors.appPrimaryColor,
                  child: Image.asset("assets/images/registerOld-removebg.png"),
                )
            ),

            SizedBox(height: 20,),

            Expanded(
                flex: 2,
                child: Form(child: Column(
                  children: [
                    CustomTextFormField(),
                    CustomTextFormField(),
                    CustomTextFormField(),
                    CustomTextFormField(),

                  ],
                ))
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                width: 150,
                child: BotaoPrimario(text: "Salvar"),
              ),
            ),
            SizedBox(height: 20,)
            


          ],
        ),
      ),
    );
  }
}
