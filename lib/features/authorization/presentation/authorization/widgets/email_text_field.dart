import 'package:flutter/material.dart';
import 'package:new_weather_app/core/constants/colors.dart';
import 'package:new_weather_app/core/constants/text_styles.dart';

class EmailTextFieldWidget extends StatelessWidget {
  final TextEditingController email;
  const EmailTextFieldWidget({
    super.key, required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: email,
      keyboardType: TextInputType.emailAddress,
      scrollPadding: EdgeInsets.zero,
      cursorColor: ColorStyles.redColor,
      decoration: InputDecoration(
        labelText: 'Email',
        labelStyle: TextStyles(color: ColorStyles.greyColor).b1,
        contentPadding: const EdgeInsets.only(bottom: 13),
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
