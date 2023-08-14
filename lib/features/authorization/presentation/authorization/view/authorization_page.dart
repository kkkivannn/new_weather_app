import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:new_weather_app/core/constants/colors.dart';
import 'package:new_weather_app/core/constants/routers.dart';
import 'package:new_weather_app/core/constants/text_styles.dart';
import 'package:new_weather_app/core/custom_widgets/app_bar.dart';
import 'package:new_weather_app/core/custom_widgets/custom_button.dart';
import 'package:new_weather_app/features/authorization/presentation/authorization/controller/authorization_cubit.dart';
import 'package:new_weather_app/features/authorization/presentation/authorization/widgets/password_text_field.dart';

import '../widgets/email_text_field.dart';

class AuthorizationPage extends StatefulWidget {
  const AuthorizationPage({super.key});

  @override
  State<AuthorizationPage> createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthorizationCubit, AuthorizationState>(
      listener: (context, state) {
        if (state is AuthorizationLoadedState) {
          context.push(Routers.weather);
        } else if (state is AuthorizationErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              action: SnackBarAction(
                label: '',
                onPressed: () => null,
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: ColorStyles.whiteColor,
          appBar: appBar(ColorStyles.whiteColor),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
            child: SafeArea(
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                children: [
                  Text(
                    'Вход',
                    style: TextStyles(color: ColorStyles.blackColor).h1,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Введите данные для входа ',
                    style: TextStyles(color: ColorStyles.greyColor).b2,
                  ),
                  const SizedBox(
                    height: 51,
                  ),
                  EmailTextFieldWidget(
                    email: email,
                  ),
                  const SizedBox(
                    height: 58,
                  ),
                  PasswordTextFieldWidget(
                    password: password,
                  ),
                  TextButton(
                    onPressed: () => context.push(Routers.registration),
                    child: Text(
                      'У меня нет аккаунта',
                      style: TextStyles(color: ColorStyles.accentColor).b1,
                    ),
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  CustomButton(
                    title: 'Войти',
                    onTap: () async {
                      try {
                        await context
                            .read<AuthorizationCubit>()
                            .signIn(email: email.text, password: password.text);
                      } catch (e) {}
                    },
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
