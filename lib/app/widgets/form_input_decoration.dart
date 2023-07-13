import 'package:auth_app/app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final TextInputType? keyboardType;
  final int maxLines;
  final bool obscureText;
  final bool isPassword;
  final bool hasPrefixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffix;
  final String? prefixTxt;
  final Function(String value)? onChangeCallback;

  MyTextFormField({
    super.key,
    required this.controller,
    required this.label,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    this.obscureText = false,
    this.isPassword = false,
    this.hasPrefixIcon = false,
    this.inputFormatters,
    this.suffix,
    this.prefixTxt,
    this.onChangeCallback,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: inputFormatters,
      obscureText: obscureText,
      autofocus: false,
      controller: controller,
      maxLines: maxLines,
      cursorColor: AppConstants.primaryColor,
      keyboardType: keyboardType,
      textInputAction: TextInputAction.done,
      decoration: inputDecoration(context),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Это поле обязательно к заполнению';
        }
        if (TextInputType.emailAddress == keyboardType) {
          // validate emailAddress
          final email = value.replaceAll(RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$'), '');
          return email.length != 8 ? 'Неверный адрес электронной почты' : null;
        }

        // validate password
        if (isPassword) {
          return value.length < 5 ? 'Длина должна быть не менее 5 символов' : null;
        }
        return null;
      },
      // onChanged: (value) => onChangeCallback!(value),
    );
  }

  InputDecoration inputDecoration(BuildContext context) {
    return InputDecoration(
      alignLabelWithHint: maxLines != 1,
      suffixIcon: suffix,
      suffixIconConstraints: const BoxConstraints(),
      contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      labelText: label,
      // errorText: widget.errorText,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: AppConstants.textFieldColor,
          width: 2,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: AppConstants.textFieldColor,
          width: 2,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: AppConstants.accentColor,
          width: 3,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: AppConstants.textFieldColor,
          width: 2,
        ),
      ),
      labelStyle: GoogleFonts.rubik(
        textStyle: Theme.of(context).primaryTextTheme.bodyMedium?.copyWith(
              fontSize: 18,
              color: AppConstants.textFieldColor,
            ),
      ),
    );
  }
}
