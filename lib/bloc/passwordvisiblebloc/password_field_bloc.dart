import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'password_field_event.dart';
part 'password_field_state.dart';

class PasswordFieldBloc extends Bloc<PasswordFieldEvent, PasswordFieldState> {
  PasswordFieldBloc() : super(PasswordFieldInitial()) {
    on<VisibilityChangeEvent>((event, emit) {
      emit.call(PasswordVisibilitState(event.obscure));
    });
  }
}
