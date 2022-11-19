

// ignore_for_file: avoid_single_cascade_in_expression_statements

import 'package:abdallah_mansour/modules/social_app/social_login_screen/cubit/states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SocialLoginCubit extends Cubit<SocialLoginStates>{

  /// عند إنشاء أي cubit فأننا لازم نستدعي constructor الخاص به و نعطيه القيمة initial ونقوم بوضعه داخل constructor class
  SocialLoginCubit() : super(SocialLoginInitialState());


  /// هنا قمنا بإنشاء object من cubit حتى نستدعيه من أي مكان نريه
  static SocialLoginCubit get(context) => BlocProvider.of(context);



  void userLogin({
    required String email,
    required String password,
}){
    emit(SocialLoginLodingState());

    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
    ).then((value){
      print(value.user!.email);
      print(value.user!.uid);
      emit(SocialLoginSuccessState(value.user!.uid));
    }).catchError((error){
      emit(SocialLoginErrorState(error));
    });

  }


IconData sufix = Icons.visibility_outlined;
bool isPassword = true;


void changePasswordVisibility(){
  isPassword = ! isPassword;
  sufix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
  emit(SocialChangePasswordVisibilityState());
}


}