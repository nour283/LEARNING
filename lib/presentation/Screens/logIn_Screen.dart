import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tadrib_hub/presentation/Buttoms/custom_button.dart';
import 'package:tadrib_hub/resources/app_router.dart';
import 'package:tadrib_hub/resources/color_manager.dart';
import 'package:tadrib_hub/resources/strings_manager.dart';
import 'package:tadrib_hub/resources/values_manager.dart';
import 'package:tadrib_hub/resources/assets_manager.dart';
import 'package:tadrib_hub/presentation/Buttoms/bottom_wave_clipper.dart';
import 'package:tadrib_hub/presentation/Widgets/custom_text_field.dart';
import 'package:tadrib_hub/presentation/Widgets/social_login.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.backgroundWhite,
      body: Stack(
        children: [
          Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: size.height * 0.22,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(ImageAssets.loginBackground),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: size.height * 0.13,
                    left: 20,
                    child: Text(
                      AppStrings.logIn,
                      style: TextStyle(
                        color: AppColors.primaryWhite,
                        fontSize: AppValues.fontSizeExtraLarge,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(AppValues.paddingMedium),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextField(
                        label: AppStrings.yourEmail,
                        hint: AppStrings.emailHint,
                        icon: Icons.email,
                      ),
                      CustomTextField(
                        label: AppStrings.password,
                        hint: AppStrings.passwordHint,
                        icon: Icons.lock,
                        isPassword: true,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            context.push(AppRoutes.forgetPassword);
                          },
                          child: Text(
                            AppStrings.forgetPassword,
                            style: TextStyle(color: AppColors.primaryBlue),
                          ),
                        ),
                      ),
                      CustomButton(
                        text: AppStrings.logIn,
                        onPressed: () {
                          context.push(AppRoutes.layout);
                        },
                      ),
                      const SizedBox(height: AppValues.S80),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(AppStrings.dontHaveAccount),
                            TextButton(
                              onPressed: () {
                                context.go(AppRoutes.signUp);
                              },
                              child: Text(
                                AppStrings.SignUp,
                                style: TextStyle(color: AppColors.primaryBlue),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SocialLogin(),
                      const SizedBox(height: AppValues.spacingLarge),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: BottomWave(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: AppValues.paddingSmall,
                ),
                color: AppColors.backgroundBlue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
