import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_weather_app/core/constants/colors.dart';
import 'package:new_weather_app/core/constants/images.dart';
import 'package:new_weather_app/core/constants/text_styles.dart';

class InfoAboutWeather extends StatelessWidget {
  final String windSpeed;
  final String humidity;
  final Function() getWind;
  const InfoAboutWeather({
    super.key,
    required this.windSpeed,
    required this.humidity,
    required this.getWind,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ColorStyles.whiteColor.withOpacity(.25),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(SvgImg.wind),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    '$windSpeed м/с',
                    style: TextStyles(color: ColorStyles.greyColor).b2Medium,
                  ),
                ],
              ),
              const SizedBox(
                height: 18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(SvgImg.drop),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    '$humidity%',
                    style: TextStyles(color: ColorStyles.greyColor).b2Medium,
                  ),
                ],
              )
            ],
          ),
          const Spacer(),
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    getWind(),
                    style: TextStyles(color: ColorStyles.whiteColor).b2,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                Text(
                  'Высокая влажность',
                  style: TextStyles(color: ColorStyles.whiteColor).b2,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
