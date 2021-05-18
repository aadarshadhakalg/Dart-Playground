import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../bloc/registration_bloc/registration_bloc.dart';
import '../bloc/registration_bloc/registration_event.dart';
import '../bloc/registration_bloc/registration_state.dart';

class SignupPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: BlocConsumer<UserRegistrationBloc, RegistrationState>(
            listenWhen: (prevState, nextState) => prevState != nextState,
            buildWhen: (prevState, nextState) => prevState != nextState,
            listener: (context, state) {
              if (state is UserRegistrationSuccessState) {
                Navigator.pushReplacementNamed(context, '/homepage');
              } else if (state is UserRegistrationFailureState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${state.message}'),
                  ),
                );
              }
            },
            builder: (context, state) {
              if (!(state is UserRegistrationLoadingState)) {
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
                        controller: _nameController,
                        validator:
                            RequiredValidator(errorText: 'Name is required.'),
                        decoration: const InputDecoration(
                          labelText: 'Name',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        controller: _emailController,
                        validator: MultiValidator(
                          [
                            RequiredValidator(
                                errorText: 'Password is required.'),
                            EmailValidator(
                              errorText: 'Enter a valid email.',
                            )
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
                        validator: MultiValidator(
                          [
                            RequiredValidator(
                                errorText: 'Password is required.'),
                            MinLengthValidator(
                              6,
                              errorText:
                                  'Password should be at least 6 characters.',
                            )
                          ],
                        ),
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
                            BlocProvider.of<UserRegistrationBloc>(context).add(
                              SignupButtonPressedEvent(
                                email: _emailController.text,
                                name: _nameController.text,
                                password: _passordController.text,
                              ),
                            );
                          }
                        },
                        child: const Text('Signup'),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const Divider(),
                      const Center(child: Text('Already have an account?')),
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
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
