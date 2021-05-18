import 'package:dartcompiler/authentication/bloc/auth_bloc/auth_bloc.dart';
import 'package:dartcompiler/authentication/repositories/user_repository.dart';
import 'package:dartcompiler/global/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:dartcompiler/l10n/l10n.dart';

class App extends StatefulWidget {
  App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final AppRoutes _appRoutes = AppRoutes();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (BuildContext context) => AuthBloc(),
      child: RepositoryProvider<UserRepository>(
        create: (BuildContext context) => UserRepository.getInstance,
        child: MaterialApp(
          theme: ThemeData(
            accentColor: const Color(0xFF13B9FF),
            appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
          ),
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          initialRoute: '/',
          onGenerateRoute: _appRoutes.onGenerateRoute,
        ),
      ),
    );
  }

  @override
  void dispose() { 
    _appRoutes.dispose();
    super.dispose();
  }
}
