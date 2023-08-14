import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_weather_app/core/constants/colors.dart';
import 'package:new_weather_app/core/constants/images.dart';
import 'package:new_weather_app/core/constants/text_styles.dart';

class PasswordTextFieldWidget extends StatefulWidget {
  final TextEditingController password;
  const PasswordTextFieldWidget({super.key, required this.password});

  @override
  State<PasswordTextFieldWidget> createState() =>
      _PasswordTextFieldWidgetState();
}

class _PasswordTextFieldWidgetState extends State<PasswordTextFieldWidget> {
  bool showPassword = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.password,
      keyboardType: TextInputType.visiblePassword,
      scrollPadding: EdgeInsets.zero,
      cursorColor: ColorStyles.redColor,
      obscureText: showPassword,
      decoration: InputDecoration(
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              if (showPassword) {
                showPassword = !showPassword;
              } else {
                showPassword = true;
              }
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: showPassword
                ? SvgPicture.asset(SvgImg.openEye)
                : SvgPicture.asset(SvgImg.closeEye),
          ),
        ),
        labelText: 'Пароль',
        labelStyle: TextStyles(color: ColorStyles.greyColor).b1,
        contentPadding: EdgeInsets.zero,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: ColorStyles.greyTextFieldColor,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: ColorStyles.accentColor,
          ),
        ),
      ),
    );
  }
}
