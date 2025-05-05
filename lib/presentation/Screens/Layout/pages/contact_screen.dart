import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tadrib_hub/presentation/Buttoms/custom_button.dart';
import 'package:tadrib_hub/resources/color_manager.dart';
import 'package:tadrib_hub/resources/strings_manager.dart';
import 'package:tadrib_hub/resources/values_manager.dart';

class ContactFormScreen extends StatelessWidget {
  const ContactFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.08,
                vertical: size.height * 0.05,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(AppStrings.Get_touch
                      ,
                      style: TextStyle(
                        fontSize: size.width * 0.07,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryBlue,
                      ),
                    ),
                    SizedBox(height: size.height * 0.01),
                    Text(
                      AppStrings.fill,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: size.width * 0.04,
                        color: Colors.grey,
                      ),
                    ),
                    CustomTextField(hint: AppStrings.Name),
                    CustomTextField(hint: AppStrings.Company_email),
                    CustomTextField(hint: AppStrings.Phone_number),
                    CustomTextField(hint: "Title/position"),
                    CustomTextField(hint: "Subject"),
                    SizedBox(height: size.height * 0.04),
                    CustomButton(
                      text: "Connect with us",
                      onPressed: () {},
                      width: double.infinity,
                      height: size.height * 0.07,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTextField extends StatefulWidget {
  final String hint;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool isPassword;

  const CustomTextField({
    super.key,
    required this.hint,
    this.controller,
    this.keyboardType,
    this.inputFormatters,
    this.isPassword = false,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppValues.spacingMedium),
      child: TextField(
        controller: widget.controller,
        obscureText: widget.isPassword ? _obscureText : false,
        keyboardType: widget.keyboardType,
        inputFormatters: widget.inputFormatters ?? [],
        decoration: InputDecoration(
          hintText: widget.hint,
          border: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 2),
          ),
        ),
      ),
    );
  }
}
