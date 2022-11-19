// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:abdallah_mansour/modules/shop_app/register/shop_registeer_screen.dart';
import 'package:abdallah_mansour/shared/components/components.dart';
import 'package:flutter/material.dart';

class ShopLoginScreen extends StatelessWidget {

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
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
                    suffix: Icons.visibility,
                    suffixPressed: (){

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
                    function: (){},
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
                            ShopRegisterScreen(),
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
    );
  }
}
