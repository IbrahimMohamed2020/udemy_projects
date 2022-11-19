import 'package:abdallah_mansour/models/social_app/social_user_model.dart';
import 'package:abdallah_mansour/modules/social_app/social_register_screen/cubit/states.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SocialRegisterCubit extends Cubit<SocialRegisterStates>{

  /// عند إنشاء أي cubit فأننا لازم نستدعي constructor الخاص به و نعطيه القيمة initial ونقوم بوضعه داخل constructor class
  SocialRegisterCubit() : super(SocialRegisterInitialState());


  /// هنا قمنا بإنشاء object من cubit حتى نستدعيه من أي مكان نريه
  static SocialRegisterCubit get(context) => BlocProvider.of(context);



  void userRegister({
    required String name,
    required String email,
    required String password,
    required String phone,
}){
    print('Helllo hello hello hello hello hello ');
    emit(SocialRegisterLodingState());

    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
    ).then((value){

      createUser(
          uId: value.user!.uid,
          name: name,
          eamil: email,
          phone: phone,
      );
    }).catchError((error){
      emit(SoiclRegisterErrorState(error.toString()));
    });
  }

/// هنا نقوم بإنشاء جدول في fire-store و نضع بداخله عناصر لها id و بيانات خاصب ب id

  void createUser({
    required String name,
    required String eamil,
    required String phone,
    required String uId,
}){
    SocialUserModel model = SocialUserModel(
        name: name,
        email: eamil,
        phone: phone,
        uId: uId,
      isEmailVerified: false,
    );

    FirebaseFirestore.instance.
    collection('users').
    doc(uId).
    set(model.toMap()).
    then((value) {
      emit(SocialCreatUserSuccessState());
    }).catchError((error){
      emit(SocialCreatUserErrorState(error.toString()));
    });
  }


IconData sufix = Icons.visibility_outlined;
bool isPassword = true;


void changePasswordVisibility(){
  isPassword = ! isPassword;
  sufix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
  emit(SocialRegisterChangePasswordVisibilityState());
}


}