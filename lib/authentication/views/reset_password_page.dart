import 'package:dartcompiler/authentication/bloc/password_reset_bloc/password_reset_bloc.dart';
import 'package:dartcompiler/authentication/bloc/password_reset_bloc/password_reset_event.dart';
import 'package:dartcompiler/authentication/bloc/password_reset_bloc/password_reset_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';

class ResetPasswordPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocConsumer<PasswordResetBloc, PasswordResetState>(
          buildWhen: (prevState, nextState) => prevState != nextState,
          listenWhen: (prevState, nextState) => prevState != nextState,
          listener: (context, state) {
            if (state is PasswordResetLinkSendFailureState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${state.message}'),
                ),
              );
            }
          },
          builder: (context, state) {
            if (!(state is PasswordResetLinkSendLoadingState)) {
              if (state is PasswordResetLinkSendSuccessState) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Icon(
                      Icons.email_outlined,
                      color: Colors.green,
                      size: 100.0,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const Center(
                      child: Text(
                        'Check Inbox',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      state.message,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/loginpage');
                      },
                      child: const Text('Login'),
                    ),
                  ],
                );
              } else {
                return Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: _emailController,
                        validator: MultiValidator(
                          [
                            RequiredValidator(errorText: 'Email is required.'),
                            EmailValidator(
                                errorText: 'Please enter a valid email.'),
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
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            BlocProvider.of<PasswordResetBloc>(context).add(
                              ResetPasswordButtonPressed(
                                  email: _emailController.text),
                            );
                          }
                        },
                        child: const Text('Send Reset Email'),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 10.0,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/loginpage');
                        },
                        child: const Text('Login'),
                      ),
                    ],
                  ),
                );
              }
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
