part of 'password_field_bloc.dart';

@immutable
abstract class PasswordFieldEvent {
  const PasswordFieldEvent();
}

class VisibilityChangeEvent extends PasswordFieldEvent {
  final bool obscure;
  const VisibilityChangeEvent(this.obscure);
}
