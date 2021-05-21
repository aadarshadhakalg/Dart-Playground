import 'dart:io';

import 'package:dartcompiler/profile/bloc/profile_info_bloc/profile_bloc.dart';
import 'package:dartcompiler/profile/bloc/profile_info_bloc/profile_event.dart';
import 'package:dartcompiler/profile/bloc/profile_info_bloc/profile_state.dart';
import 'package:dartcompiler/profile/bloc/profile_photo_bloc/profile_photo_bloc.dart';
import 'package:dartcompiler/profile/repository/profile_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Profile'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BlocBuilder<ProfilePhotoBloc, ProfilePhotoState>(
                builder: (context, state) {
                  return Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 2,
                          height: MediaQuery.of(context).size.width / 2,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 5.0,
                              color: Colors.indigoAccent,
                            ),
                            borderRadius: BorderRadius.circular(
                                MediaQuery.of(context).size.width),
                          ),
                          child: (state is ProfilePhotoPickedState)
                              ? ClipOval(
                                  child: Image.file(
                                    File(state.pickedImage),
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : ClipOval(
                                  child: Image.network(
                                    RepositoryProvider.of<ProfileRepository>(
                                            context)
                                        .currentUserProfile!
                                        .photo,
                                  ),
                                ),
                        ),
                        Positioned.fill(
                          child: (state is ProfilePhotoPickedState)
                              ? const CircularProgressIndicator(
                                  strokeWidth: 8.0,
                                  color: Colors.white,
                                )
                              : (state is ProfilePhotoUploadSuccessState)
                                  ? const Icon(
                                      Icons.check,
                                      color: Colors.green,
                                      size: 50.0,
                                    )
                                  : (state is ProfilePhotoUploadFailureState)
                                      ? const Icon(
                                          Icons.error,
                                          color: Colors.red,
                                          size: 50.0,
                                        )
                                      : Container(),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: InkWell(
                            child: FloatingActionButton(
                              tooltip: 'Upload Profile Photo',
                              onPressed: () {
                                BlocProvider.of<ProfilePhotoBloc>(context).add(
                                  ProfilePhotoUploadButtonPressedEvent(),
                                );
                              },
                              child: const Icon(
                                Icons.upload,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 30.0,
              ),
              Expanded(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      BlocBuilder<ProfileBloc, ProfileState>(
                        builder: (context, state) {
                          return TextFormField(
                            controller: _nameController,
                            enabled:
                                (state is ProfileEditingState) ? true : false,
                            decoration: const InputDecoration(
                              labelText: 'Name',
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 20.0),
                    ],
                  ),
                ),
              ),
              BlocConsumer<ProfileBloc, ProfileState>(
                buildWhen: (prevState, nextState) => prevState != nextState,
                listenWhen: (prevState, nextState) => prevState != nextState,
                listener: (context, state) {
                  //TODO: Try to merge in one
                  if (state is ProfileSubmitSuccessState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${state.message}'),
                      ),
                    );
                  } else if (state is ProfileSubmitFailureState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${state.message}'),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  return Tooltip(
                    message: (state is ProfileEditingState)
                        ? 'Save profile'
                        : 'Edit Profile',
                    child: ElevatedButton.icon(
                      onPressed: () {
                        if (state is ProfileEditingState) {
                          BlocProvider.of<ProfileBloc>(context).add(
                            SaveProfileButtonPressedEvent(
                                name: _nameController.text),
                          );
                        } else if (!(state is ProfileSubmitLoadingState))
                          BlocProvider.of<ProfileBloc>(context).add(
                            EditProfileButtonPressedEvent(),
                          );
                      },
                      icon: Icon(
                        Icons.edit,
                        color: (state is ProfileSubmitLoadingState)
                            ? Colors.transparent
                            : Colors.white,
                      ),
                      label: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: (state is ProfileEditingState)
                            ? const Text('Save Profile')
                            : (state is ProfileSubmitLoadingState)
                                ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : const Text('Edit Profile'),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
