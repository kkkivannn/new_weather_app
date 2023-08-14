import 'package:go_router/go_router.dart';
import 'package:new_weather_app/core/constants/routers.dart';
import 'package:new_weather_app/features/authorization/presentation/authorization/view/authorization_page.dart';
import 'package:new_weather_app/features/authorization/presentation/registration/view/registration_page.dart';
import 'package:new_weather_app/features/splash_screen/view/splash_screen.dart';
import 'package:new_weather_app/features/weather/presentation/view/weather_page.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    initialLocation: Routers.initial,
    routes: [
      GoRoute(
        name: Routers.initial,
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        name: Routers.weather,
        path: "/weather",
        builder: (context, state) => const WeatherPage(),
      ),
      GoRoute(
        name: Routers.registration,
        path: "/registration",
        builder: (context, state) => const RegistartionPage(),
      ),
      GoRoute(
        name: Routers.authorize,
        path: "/authorize",
        builder: (context, state) => const AuthorizationPage(),
      ),
    ],
  );
}
