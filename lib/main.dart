import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_weather_app/features/authorization/presentation/authorization/controller/authorization_cubit.dart';
import 'package:new_weather_app/features/authorization/presentation/registration/controller/registration_cubit.dart';
import 'package:new_weather_app/features/weather/presentation/controller/weather_cubit.dart';
import 'package:new_weather_app/injection.container.dart';
import 'package:new_weather_app/router.dart';

import 'injection.container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.init();
  runApp(const MainWrapper());
}

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WeatherCubit>(
          create: (context) => sl<WeatherCubit>(),
        ),
        BlocProvider<AuthorizationCubit>(
          create: (context) => sl<AuthorizationCubit>(),
        ),
        BlocProvider<RegistrationCubit>(
          create: (context) => sl<RegistrationCubit>(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
