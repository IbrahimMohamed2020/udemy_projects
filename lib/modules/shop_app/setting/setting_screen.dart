// ignore_for_file: prefer_const_constructors

import 'package:abdallah_mansour/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingScreen extends StatelessWidget {

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      listener: (context, state) {},
      builder: (context, state)  {
        return  Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                defultTextFormFiled(
                  controller: nameController,
                  types: TextInputType.name,
                  lable: 'Name',
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


              ],
            ),
          ),
        );
      },
    );
  }
}
