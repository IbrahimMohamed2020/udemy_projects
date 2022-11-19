
// ignore_for_file: prefer_const_constructors

import 'package:abdallah_mansour/modules/social_app/social_register_screen/cubit/cubit.dart';
import 'package:abdallah_mansour/modules/social_app/social_register_screen/cubit/states.dart';
import 'package:abdallah_mansour/shared/components/components.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class  SocialRegisterScreen extends StatelessWidget {

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialRegisterCubit, SocialRegisterStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return  Scaffold(
          appBar: AppBar(),
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('register'.toUpperCase(),
                        style: Theme.of(context).textTheme.headline3!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Register now to communicate with frinds',
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      defultTextFormFiled(
                        controller: nameController,
                        types: TextInputType.name,
                        lable: 'User Name',
                        prefixIcon: Icons.person,
                        validate: (String name){
                          if(name.isEmpty){
                            return 'name must be empty';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      defultTextFormFiled(
                        controller: emailController,
                        types: TextInputType.emailAddress,
                        lable: 'Email Address',
                        prefixIcon: Icons.email_outlined,
                        validate: (String name){
                          if(name.isEmpty){
                            return 'email address must be empty';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      defultTextFormFiled(
                        controller: passwordController,
                        types: TextInputType.visiblePassword,
                        lable: 'Password',
                        prefixIcon: Icons.lock,
                        validate: (String name){
                          if(name.isEmpty){
                            return 'name must be empty';
                          }
                          return null;
                        },
                      ),

                      SizedBox(
                        height: 15,
                      ),

                      defultTextFormFiled(
                        controller: phoneController,
                        types: TextInputType.phone,
                        lable: 'Phone Number',
                        prefixIcon: Icons.phone,
                        validate: (String name){
                          if(name.isEmpty){
                            return 'phone number must be empty';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ConditionalBuilder(
                        condition: state is! SocialRegisterLodingState,
                        builder: (context) => defultButton(
                          function: (){
                            if (formKey.currentState!.validate()) {

                            }
                            SocialRegisterCubit.get(context).userRegister(
                              name: nameController.text,
                              email: emailController.text,
                              password: passwordController.text,
                              phone: phoneController.text,
                            );
                          },
                          text: 'register',
                        ),
                        fallback: (context) => Center(
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.blue,
                              color: Colors.grey,
                              strokeWidth: 5,
                            ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
