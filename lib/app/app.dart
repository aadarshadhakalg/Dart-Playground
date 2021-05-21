import 'package:dartcompiler/profile/repository/profile_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../authentication/bloc/auth_bloc/auth_bloc.dart';
import '../global/routes/app_routes.dart';
import '../l10n/l10n.dart';

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
      child: RepositoryProvider<ProfileRepository>(
        create: (BuildContext context) => ProfileRepository.getInstance,
        child: MaterialApp(
          theme: ThemeData(
            accentColor: Colors.indigo,
            appBarTheme: const AppBarTheme(color: Colors.indigo),
            floatingActionButtonTheme: const FloatingActionButtonThemeData(
              foregroundColor: Colors.white,
            ),
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
