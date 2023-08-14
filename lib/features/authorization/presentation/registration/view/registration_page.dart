import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:new_weather_app/core/constants/colors.dart';
import 'package:new_weather_app/core/constants/routers.dart';
import 'package:new_weather_app/core/constants/text_styles.dart';
import 'package:new_weather_app/core/custom_widgets/app_bar.dart';
import 'package:new_weather_app/core/custom_widgets/custom_button.dart';
import 'package:new_weather_app/features/authorization/presentation/authorization/widgets/email_text_field.dart';
import 'package:new_weather_app/features/authorization/presentation/authorization/widgets/password_text_field.dart';
import 'package:new_weather_app/features/authorization/presentation/registration/controller/registration_cubit.dart';

class RegistartionPage extends StatefulWidget {
  const RegistartionPage({super.key});

  @override
  State<RegistartionPage> createState() => _RegistartionPageState();
}

class _RegistartionPageState extends State<RegistartionPage> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegistrationCubit, RegistrationState>(
      listener: (context, state) {
        if (state is RegistrationLoadedState) {
          context.push(Routers.initial);
        } else if (state is RegistrationErrorState) {
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
                    'Регистрация',
                    style: TextStyles(color: ColorStyles.blackColor).h1,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Введите данные для регистрации',
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
                  const SizedBox(
                    height: 48,
                  ),
                  CustomButton(
                    title: 'Регистрация',
                    onTap: () async {
                      await context
                          .read<RegistrationCubit>()
                          .sinUp(email: email.text, password: password.text);
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
