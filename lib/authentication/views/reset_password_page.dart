import 'package:dartcompiler/authentication/bloc/password_reset_bloc/password_reset_bloc.dart';
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
      body: Center(
        child: BlocConsumer<PasswordResetBloc,PasswordResetState>(
          buildWhen: (prevState, nextState) => prevState != nextState,
          listenWhen: (prevState, nextState) => prevState != nextState,
          listener: (context, state) {},
          builder: (context, state) {
            return Form(
              key: _formKey,
              child: Column(
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
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Send Reset Email'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
