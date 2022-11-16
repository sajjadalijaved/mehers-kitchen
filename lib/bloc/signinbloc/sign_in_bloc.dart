// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:mehers_kitchen/authentication/authentication.dart';
import 'package:mehers_kitchen/modelclasses/sign_in_user.dart';
import 'package:mehers_kitchen/modelclasses/sign_in_with_google.dart';
import 'package:mehers_kitchen/widgets/client_id.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial()) {
    on<SignInSuccessfullyEvent>((event, emit) async {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      emit.call(SignInLoadingState());
      try {
        Map<String, dynamic> data = await signInUser(event.model);
        if (data['Status'] == 'Invalid UserName/Password') {
          emit.call(
              SignInFailedState(message: 'InValid User Name or Password'));
        } else if (data['Status'] == 'Login Successfully') {
          ClientId.clientId = data['Id'];
          sharedPreferences.setInt('clientId', data['Id']);
          emit.call(SignInSuccessfullyState());
        }
      } catch (e) {
        emit.call(
          SignInFailedState(
            message: e.toString(),
          ),
        );
      }
    });
    on<SignInWithGoogleEvent>((event, emit) async {
      emit.call(SignInLoadingState());
      try {
        Map<String, dynamic> data = await signInWithGoogleThroughApiService(
            event.signInWithGoogleModel);

        if (data['Status'] == 'Login Successfully') {
          SharedPreferences sharedPreferences =
              await SharedPreferences.getInstance();
          int id = data['Id'];

          sharedPreferences.setInt('clientId', id);

          ClientId.clientId = data['Id'];

          emit.call(SignInWithGoogleSuccessfullyState());
        } else {
          SignInFailedState(message: 'Sorry');
        }
      } catch (e) {
        emit.call(SignInWithGoogleFailedState(message: e.toString()));
      }
    });
  }
}
