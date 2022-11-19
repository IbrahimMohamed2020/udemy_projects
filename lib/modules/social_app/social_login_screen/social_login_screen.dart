// ignore_for_file: prefer_const_constructors

import 'package:abdallah_mansour/layout/soical_app/social_layout.dart';
import 'package:abdallah_mansour/modules/social_app/social_login_screen/cubit/cubit.dart';
import 'package:abdallah_mansour/modules/social_app/social_login_screen/cubit/states.dart';
import 'package:abdallah_mansour/modules/social_app/social_register_screen/social_register_screen.dart';
import 'package:abdallah_mansour/shared/components/components.dart';
import 'package:abdallah_mansour/shared/network/local/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SocialLoginScreen extends StatelessWidget {
  @override

  Widget build(BuildContext context) {

    var formKey = GlobalKey<FormState>();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    return BlocConsumer<SocialLoginCubit, SocialLoginStates>(
      listener: (context, state) {
        if(state is SocialLoginErrorState){

          
        }
        if(state is SocialLoginSuccessState){
          CacheHelper.saveData(
              key: 'uId',
              value: state.uId,
          ).then((value) {
            navigatAndFinish(context, SocialLayout());
          });
        }
      },
      builder: (context, state){
        return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Login'.toUpperCase(),
                        style:Theme.of(context).textTheme.headline4!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text('login now to browse our hot offers',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Colors.grey,
                        ),

                      ),
                      SizedBox(
                        height: 15,
                      ),
                      defultTextFormFiled(
                        controller: emailController,
                        types: TextInputType.emailAddress,
                        lable: 'Email Address',
                        prefixIcon: Icons.email,
                        validate: (String value){
                          if(value.isEmpty){
                            return 'please enter your email address';
                          }
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      defultTextFormFiled(
                        controller: passwordController,
                        types: TextInputType.visiblePassword,
                        lable: 'Password',
                        prefixIcon: Icons.lock_outline,
                        suffix: SocialLoginCubit.get(context).sufix,

                        suffixPressed: (){
                          SocialLoginCubit.get(context).changePasswordVisibility();
                        },
                        validate: (String value){
                          if(value.isEmpty){
                            return 'Please enter your passwored';
                          }
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      defultButton(
                        function: (){
                          if(formKey.currentState!.validate()){
                            SocialLoginCubit.get(context).userLogin(
                                email: emailController.text,
                                password: passwordController.text,
                            );
                          }
                        },
                        text: 'login',
                        isUpperCase: true,
                      ),
                      SizedBox(
                        height: 15,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an account?',
                          ),
                          TextButton(
                            onPressed: (){
                              navigatTo(
                                context,
                                SocialRegisterScreen(),
                              );
                            },
                            child: Text('register'.toUpperCase()),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}

