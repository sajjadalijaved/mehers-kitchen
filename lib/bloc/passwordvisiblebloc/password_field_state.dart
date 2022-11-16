part of 'password_field_bloc.dart';

@immutable
abstract class PasswordFieldState {}

class PasswordFieldInitial extends PasswordFieldState {}

class PasswordVisibilitState extends PasswordFieldState {
  bool obscure;
  PasswordVisibilitState(this.obscure);
}
