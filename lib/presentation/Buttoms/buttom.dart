import 'package:flutter/material.dart';
import 'package:tadrib_hub/resources/color_manager.dart';

class NavigationButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final EdgeInsetsGeometry padding;

  const NavigationButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(24.0), // Make the ripple effect circular
        child: Container(
          width: 48.0, // عرض الدائرة
          height: 48.0, // ارتفاع الدائرة
          decoration: BoxDecoration(
            shape: BoxShape.circle, // شكل الدائرة
            color: Colors.white, // لون الدائرة الداخلي
            border: Border.all(
              color: AppColors.primaryBlue, // اللون الأزرق للحواف
              width: 2.0, // سمك الحواف
            ),
          ),
          child: Center(
            child: Icon(
              icon,
              color: AppColors.primaryBlue, // اللون الأزرق للأيقونة
              size: 24.0, // حجم الأيقونة
            ),
          ),
        ),
      ),
    );
  }
}