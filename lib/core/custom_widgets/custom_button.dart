import 'package:flutter/material.dart';
import 'package:new_weather_app/core/constants/colors.dart';
import 'package:new_weather_app/core/constants/text_styles.dart';

class CustomButton extends StatefulWidget {
  final Function() onTap;
  final String title;
  const CustomButton({super.key, required this.onTap, required this.title});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onTap,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          ColorStyles.accentColor,
        ),
        elevation: const MaterialStatePropertyAll<double>(0),
        overlayColor: const MaterialStatePropertyAll(
          Colors.transparent,
        ),
        minimumSize: const MaterialStatePropertyAll<Size>(
          Size(double.infinity, 50),
        ),
        shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
      ),
      child: Text(
        widget.title,
        style: TextStyles(color: ColorStyles.whiteColor).b1Medium,
      ),
    );
  }
}
