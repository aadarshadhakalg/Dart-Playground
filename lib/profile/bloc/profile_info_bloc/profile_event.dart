import 'package:equatable/equatable.dart';

abstract class ProfileEvent extends Equatable {}

class EditProfileButtonPressedEvent extends ProfileEvent {
  @override
  List<Object?> get props => [];
}

class SaveProfileButtonPressedEvent extends ProfileEvent {
  SaveProfileButtonPressedEvent({required this.name});
  final String name;

  @override
  List<Object?> get props => [name];
}
