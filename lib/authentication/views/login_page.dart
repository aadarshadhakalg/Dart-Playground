import 'package:dartcompiler/authentication/bloc/login_bloc/login_bloc.dart';
import 'package:dartcompiler/authentication/bloc/login_bloc/login_event.dart';
import 'package:dartcompiler/authentication/bloc/login_bloc/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';

class LoginPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: BlocConsumer<UserLoginBloc,LoginState>(
              listenWhen: (prevState, nextState) => prevState != nextState,
              buildWhen: (prevState, nextState) => prevState != nextState,
              listener: (BuildContext context, Object? state) {
                if (state is UserLoginSuccessState) {
                  Navigator.pushReplacementNamed(context, '/homepage');
                } else if (state is UserLoginFailureState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${state.message}'),
                    ),
                  );
                }
              },
              builder: (BuildContext context, state) {
                if (!(state is UserLoginLoadingState)) {
                  return Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Image.asset(
                          'assets/images/dart-logo.png',
                          height: 100.0,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          controller: _emailController,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                  errorText: 'Email is required.'),
                              EmailValidator(errorText: 'Please enter a valid.')
                            ],
                          ),
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          controller: _passordController,
                          obscureText: true,
                          validator: RequiredValidator(
                              errorText: 'Password is required.'),
                          decoration: const InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              BlocProvider.of<UserLoginBloc>(context).add(
                                LoginButtonPressedEvent(
                                  email: _emailController.text,
                                  password: _passordController.text,
                                ),
                              );
                            }
                          },
                          child: const Text('Login'),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        const Divider(),
                        const Center(child: Text('Don\'t have an account?')),
                        const SizedBox(
                          height: 20.0,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, '/signuppage');
                          },
                          child: const Text('Signup'),
                        ),
                      ],
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ),
      ),
    );
  }
}
