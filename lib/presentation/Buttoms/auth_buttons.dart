import 'package:flutter/material.dart';
import 'package:tadrib_hub/resources/color_manager.dart';
import 'package:tadrib_hub/resources/strings_manager.dart';
import 'package:tadrib_hub/resources/values_manager.dart';

class AuthButtons extends StatelessWidget {
  final VoidCallback onLoginPressed;
  final VoidCallback onSignUpPressed;
  final bool isLoginSelected;

  const AuthButtons({
    super.key,
    required this.onLoginPressed,
    required this.onSignUpPressed,
    required this.isLoginSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: onLoginPressed,
          borderRadius: BorderRadius.circular(AppValues.borderRadius),
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: AppValues.buttonVerticalPadding,
              horizontal: AppValues.buttonHorizontalPadding,
            ),
            decoration: BoxDecoration(
              color: isLoginSelected ? AppColors.primaryBlue : AppColors.white,
              borderRadius: BorderRadius.circular(AppValues.borderRadius),
              border: Border.all(
                color: AppColors.primaryBlue,
                width: AppValues.borderWidth,
              ),
            ),
            child: Text(
              AppStrings.logIn,
              style: TextStyle(
                color:
                    isLoginSelected ? AppColors.white : AppColors.primaryBlue,
                fontSize: AppValues.fontSize,
              ),
            ),
          ),
        ),

        SizedBox(width: AppValues.spacingMedium),

        InkWell(
          onTap: onSignUpPressed,
          borderRadius: BorderRadius.circular(AppValues.borderRadius),
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: AppValues.buttonVerticalPadding,
              horizontal: AppValues.buttonHorizontalPadding,
            ),
            decoration: BoxDecoration(
              color: isLoginSelected ? AppColors.white : AppColors.primaryBlue,
              borderRadius: BorderRadius.circular(AppValues.borderRadius),
              border: Border.all(
                color: AppColors.primaryBlue,
                width: AppValues.borderWidth,
              ),
            ),
            child: Text(
              AppStrings.SignUp,
              style: TextStyle(
                color:
                    isLoginSelected ? AppColors.primaryBlue : AppColors.white,
                fontSize: AppValues.fontSize,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
