import 'package:dartcompiler/home/bloc/function_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../authentication/bloc/login_bloc/login_bloc.dart';
import '../../authentication/bloc/password_reset_bloc/password_reset_bloc.dart';
import '../../authentication/bloc/registration_bloc/registration_bloc.dart';
import '../../authentication/views/login_page.dart';
import '../../authentication/views/reset_password_page.dart';
import '../../authentication/views/signup_page.dart';
import '../../home/views/home_page.dart';
import '../views/splash_screen.dart';

class AppRoutes {
  final UserLoginBloc userLoginBloc = UserLoginBloc();
  final UserRegistrationBloc userRegistrationBloc = UserRegistrationBloc();
  final PasswordResetBloc passwordResetBloc = PasswordResetBloc();
  final FunctionBloc functionBloc = FunctionBloc();

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case '/loginpage':
        return MaterialPageRoute(
          builder: (_) => BlocProvider<UserLoginBloc>.value(
            value: userLoginBloc,
            child: LoginPage(),
          ),
        );
      case '/signuppage':
        return MaterialPageRoute(
          builder: (_) => BlocProvider<UserRegistrationBloc>.value(
            value: userRegistrationBloc,
            child: SignupPage(),
          ),
        );
      case '/resetpasswordpage':
        return MaterialPageRoute(
          builder: (_) => BlocProvider<PasswordResetBloc>.value(
            value: passwordResetBloc,
            child: ResetPasswordPage(),
          ),
        );
      case '/homepage':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: functionBloc,
            child: HomePage(),
          ),
        );
      default:
        return _errorRoute();
    }
  }

  Route _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => const Material(
        child: Scaffold(
          backgroundColor: Colors.red,
          body: Center(
            child: Text('Invalid Route'),
          ),
        ),
      ),
    );
  }

  void dispose() {
    userRegistrationBloc.close();
    userLoginBloc.close();
    passwordResetBloc.close();
    functionBloc.close();
  }
}
