part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpLoadingState extends SignUpState {
  SignUpLoadingState();
}

class SignUpSuccessfullyState extends SignUpState {
  final int id;
  SignUpSuccessfullyState({required this.id});
}

class SignUpErrorState extends SignUpState {
  final String error;
  SignUpErrorState({required this.error});
}
