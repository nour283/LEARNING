import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:tadrib_hub/presentation/Buttoms/custom_button.dart';
import 'package:tadrib_hub/presentation/widgets/custom_text_field.dart';
import 'package:tadrib_hub/resources/app_router.dart';
import 'package:tadrib_hub/resources/color_manager.dart';
import 'package:tadrib_hub/resources/strings_manager.dart';
import 'package:tadrib_hub/resources/values_manager.dart';
import 'package:tadrib_hub/resources/assets_manager.dart';
import 'package:tadrib_hub/presentation/Buttoms/bottom_wave_clipper.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      resizeToAvoidBottomInset: false,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            height: size.height * 0.22,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(ImageAssets.signup),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            top: size.height * 0.13,
                            left: AppValues.S20,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppStrings.SignUp,
                                  style: TextStyle(
                                    color: AppColors.primaryWhite,
                                    fontSize: AppValues.fontSizeExtraLarge,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  AppStrings.enterDetails,
                                  style: TextStyle(
                                    color: AppColors.primaryWhite,
                                    fontSize: AppValues.fontSizeSmall,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
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
                              label: AppStrings.mobilePhone,
                              hint: AppStrings.mobileHint,
                              icon: Icons.phone,
                              keyboardType: TextInputType.phone,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(11),
                              ],
                            ),
                            CustomTextField(
                              label: AppStrings.password,
                              hint: AppStrings.passwordHint,
                              icon: Icons.lock,
                              isPassword: true,
                            ),
                            const SizedBox(height: AppValues.spacingMedium),
                            CustomButton(
                              text: AppStrings.createAccount,
                              onPressed: () {
                                context.go(AppRoutes.layout);
                              },
                            ),
                            const SizedBox(height: AppValues.spacingSmall),
                            buildAgreementCheckbox(),
                            const SizedBox(height: AppValues.spacingMedium),
                            buildLoginText(context),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
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
          );
        },
      ),
    );
  }

  Widget buildAgreementCheckbox() {
    return Row(
      children: [
        Checkbox(value: false, onChanged: (value) {}),
        Expanded(child: Text(AppStrings.agreeTerms)),
      ],
    );
  }

  Widget buildLoginText(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(AppStrings.alreadyHaveAccount),
          TextButton(
            onPressed: () {
              context.go(AppRoutes.login);
            },
            child: Text(
              AppStrings.logIn,
              style: TextStyle(
                color: AppColors.primaryBlue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
