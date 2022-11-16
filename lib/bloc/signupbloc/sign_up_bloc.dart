// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:mehers_kitchen/authentication/authentication.dart';
import 'package:mehers_kitchen/modelclasses/sign_up.dart';
import 'package:mehers_kitchen/widgets/client_id.dart';

import 'package:meta/meta.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<SignUpInitialEvent>((event, emit) {
      emit.call(SignUpLoadingState());
    });
    on<SignUpSuccessfullyEvent>((event, emit) async {
      try {
        Map<String, dynamic> data = await checkEmail(event.model);
        if (data['Status'] == 'Already Exists') {
          emit.call(SignUpErrorState(error: "Email Already Exist"));
        } else {
          Map<String, dynamic> data = await signUpUser(event.model);
          if (data['Status'] == 'Client Signup Successfully') {
            int clientId = data['Id'];
            ClientId.clientId = clientId;
            emit.call(SignUpSuccessfullyState(id: clientId));
          } else {
            emit.call(SignUpInitial());
          }
        }
      } catch (e) {
        emit.call(SignUpErrorState(error: e.toString()));
      }
    });
  }
}
