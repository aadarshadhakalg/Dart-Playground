import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../authentication/bloc/auth_bloc/auth_bloc.dart';
import '../../authentication/bloc/auth_bloc/auth_event.dart';
import '../../authentication/bloc/auth_bloc/auth_state.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AuthBloc>(context).add(AppStartedEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<AuthBloc,AuthState>(
          builder: (BuildContext context, state) {
            return const Center(
              child: Text('Welcome To DartCompiler'),
            );
          },
          listenWhen: (prevState,nextState) => prevState != nextState,
          listener: (BuildContext context, AuthState state) {
            if(state is AuthenticatedState){
              Navigator.pushNamed(context, '/homepage');
            } else{
              Navigator.pushNamed(context, '/loginpage');
            }
          },
        ),
      ),
    );
  }
}
