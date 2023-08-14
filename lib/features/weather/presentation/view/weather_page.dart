import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_weather_app/core/constants/colors.dart';
import 'package:new_weather_app/core/constants/constants.dart';
import 'package:new_weather_app/core/constants/images.dart';
import 'package:new_weather_app/core/constants/text_styles.dart';
import 'package:new_weather_app/core/custom_widgets/app_bar.dart';
import 'package:new_weather_app/features/weather/presentation/controller/weather_cubit.dart';
import 'package:new_weather_app/features/weather/presentation/widgets/info_about_weather.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  String degToCompass(int deg) {
    const List<String> winds = [
      "северный",
      "северо/северо-восточный",
      "сереверо-восточный",
      "восточный/северо-восточный",
      "восточный",
      "восточный/юго-восточный",
      "юго-восточный",
      "южный/юго-восточный",
      "южный",
      "южный/юго-западный",
      "юго-западный",
      "западный/юго-западный",
      "западный",
      "западный/северо-западный",
      "северо-западный",
      "северный/северо-западный"
    ];
    return "Ветер ${winds[deg ~/ 22.5]}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: appBar(ColorStyles.accentColor.withOpacity(.43)),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            colors: [
              Colors.black.withOpacity(.5),
              const Color(0xff0700FF).withOpacity(.3),
              const Color(0xff0700FF).withOpacity(.43),
              const Color(0xff0700FF).withOpacity(.43),
            ],
          ),
        ),
        child: BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is WeatherInitialState) {
              context.read<WeatherCubit>().getWeather();
            } else if (state is WeatherErrorState) {
              return Center(
                child: Text(state.error, style: TextStyles(color: ColorStyles.whiteColor).b1,),
              );
            } else if (state is WeatherLoadedState) {
              return SafeArea(
                bottom: false,
                child: ListView(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 26),
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          SvgImg.location,
                          width: 16,
                          height: 20,
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Flexible(
                          child: Text(
                            '${state.geoPosition.firstCountry!.administrativeArea!.subAdministrativeArea!.locality!.localityName}, ${state.geoPosition.firstCountry!.countryName.toString()}',
                            style: TextStyles(color: ColorStyles.whiteColor)
                                .b2Medium,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xffBD87FF),
                            blurRadius: 150,
                            offset: Offset(0, 0), // Shadow position
                          ),
                        ],
                      ),
                      child: Image.asset(
                        state.infoWeatherModel.list.first.weather.first.main ==
                                'Rain'
                            ? Img.rain
                            : state.infoWeatherModel.list.first.weather.first
                                        .main ==
                                    'Clouds'
                                ? Img.rainWithSun
                                : state.infoWeatherModel.list.first.weather
                                            .first.main ==
                                        "Storm"
                                    ? Img.storm
                                    : state.infoWeatherModel.list.first.weather
                                                .first.main ==
                                            'Snow'
                                        ? Img.snowing
                                        : Img.sun,
                        height: 190,
                        width: 194,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '${state.infoWeatherModel.list.first.main.temp.toStringAsFixed(0)}º',
                          style:
                              TextStyles(color: ColorStyles.whiteColor).h1Bold,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          state.infoWeatherModel.list.first.weather.first
                              .description,
                          style: TextStyles(color: ColorStyles.whiteColor).b1,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Макс.: ${state.infoWeatherModel.list.first.main.tempMax.toStringAsFixed(0)}º Мин: ${state.infoWeatherModel.list.first.main.tempMin.toStringAsFixed(0)}º',
                          style: TextStyles(color: ColorStyles.whiteColor).b1,
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: ColorStyles.whiteColor.withOpacity(.25),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  children: [
                                    Text(
                                      'Сегодня',
                                      style: TextStyles(
                                              color: ColorStyles.whiteColor)
                                          .b1Medium,
                                    ),
                                    const Spacer(),
                                    Text(
                                      '${DateTime.now().day.toString()} ${Constants.months[DateTime.now().month]}',
                                      style: TextStyles(
                                              color: ColorStyles.whiteColor)
                                          .b2,
                                    ),
                                  ],
                                ),
                              ),
                              const Divider(
                                color: ColorStyles.whiteColor,
                                thickness: 1,
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 16),
                                height: 142,
                                child: ListView.separated(
                                  shrinkWrap: true,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    if (state.infoWeatherModel.list[index].dtTxt
                                            .day ==
                                        DateTime.now().day) {
                                      return Container(
                                        width: 74,
                                        decoration: BoxDecoration(
                                          color: ColorStyles.whiteColor
                                              .withOpacity(.40),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          border: Border.all(
                                            color: ColorStyles.whiteColor,
                                            width: 1,
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              Constants.timeFormat.format(
                                                state.infoWeatherModel
                                                    .list[index].dtTxt,
                                              ),
                                              style: TextStyles(
                                                      color: ColorStyles
                                                          .whiteColor)
                                                  .b2,
                                            ),
                                            SvgPicture.asset(
                                              state.infoWeatherModel.list.first
                                                          .weather.first.main ==
                                                      'Rain'
                                                  ? SvgImg.cloudRain
                                                  : state
                                                              .infoWeatherModel
                                                              .list
                                                              .first
                                                              .weather
                                                              .first
                                                              .main ==
                                                          'Clouds'
                                                      ? SvgImg.cloudSun
                                                      : state
                                                                  .infoWeatherModel
                                                                  .list
                                                                  .first
                                                                  .weather
                                                                  .first
                                                                  .main ==
                                                              "Storm"
                                                          ? SvgImg
                                                              .cloudLightning
                                                          : state
                                                                      .infoWeatherModel
                                                                      .list
                                                                      .first
                                                                      .weather
                                                                      .first
                                                                      .main ==
                                                                  'Snow'
                                                              ? SvgImg.cloudSnow
                                                              : SvgImg.sun,
                                            ),
                                            Text(
                                              '${state.infoWeatherModel.list[index].main.temp.toStringAsFixed(0)}º',
                                              style: TextStyles(
                                                      color: ColorStyles
                                                          .whiteColor)
                                                  .b1Medium,
                                            ),
                                          ],
                                        ),
                                      );
                                    }
                                    return null;
                                  },
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(width: 16),
                                  itemCount: state.infoWeatherModel.list
                                      .where((element) =>
                                          element.dtTxt.day ==
                                          DateTime.now().day)
                                      .length,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        InfoAboutWeather(
                          windSpeed: state.infoWeatherModel.list[0].wind.speed
                              .toStringAsFixed(0),
                          humidity: state.infoWeatherModel.list[0].main.humidity
                              .toString(),
                              getWind: () => degToCompass(state.infoWeatherModel.list.first.wind.deg),
                        ),
                      ],
                    )
                  ],
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(
                color: ColorStyles.whiteColor,
              ),
            );
          },
        ),
      ),
    );
  }
}
