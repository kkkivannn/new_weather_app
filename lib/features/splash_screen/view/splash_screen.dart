import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:new_weather_app/core/constants/colors.dart';
import 'package:new_weather_app/core/constants/routers.dart';
import 'package:new_weather_app/core/custom_widgets/app_bar.dart';
import 'package:new_weather_app/features/authorization/presentation/authorization/controller/authorization_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthorizationCubit, AuthorizationState>(
      listener: (context, state) {
        if (state is AuthorizationHaveUserState) {
          Future.delayed(const Duration(seconds: 2))
              .then((value) => context.pushReplacement(Routers.weather));
        } else if (state is AuthorizationNotHaveUserState) {
          Future.delayed(const Duration(seconds: 2))
              .then((value) => context.pushReplacement(Routers.authorize));
        }
      },
      builder: (context, state) {
        if (state is AuthorizationInitialState) {
          context.read<AuthorizationCubit>().haveUser();
        }
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
            child: Padding(
              padding: const EdgeInsets.only(
                top: 273,
                bottom: 86,
              ),
              child: Column(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 43),
                    child: Text(
                      'WEATHER SERVICE',
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.w700,
                        color: ColorStyles.whiteColor,
                      ),
                    ),
                  ),
                  Spacer(),
                  Text(
                    'dawn is coming soon',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w300,
                      color: ColorStyles.whiteColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
