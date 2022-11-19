
// ignore_for_file: prefer_const_constructors

import 'package:abdallah_mansour/shared/components/components.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}
var emailControlar = TextEditingController();
var passwordControlar = TextEditingController();
var formKey = GlobalKey<FormState>();
bool isPassworedShow = false;

class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  defultTextFormFiled(
                    types: TextInputType.emailAddress,
                    controller: emailControlar,
                    lable: 'Email',
                    prefixIcon: Icons.email, validate: (String ) {  },
                    onTap: null,
                    //type: 'email',

                  ),
                  SizedBox(
                    height: 15,
                  ),
                  defultTextFormFiled(
                    types: TextInputType.visiblePassword,
                    controller: passwordControlar,
                    lable: 'Passwored',
                    prefixIcon: Icons.lock,
                    // type: 'passwored',
                    isPasswored: isPassworedShow,
                    suffix: isPassworedShow? Icons.visibility: Icons.visibility_off,
                    suffixPressed: (){
                      setState(() {
                        isPassworedShow = !isPassworedShow;
                      });

                    }, validate: (String ) {  },
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  defultButton(
                      background: Colors.blue,
                      width: double.infinity,
                      text: 'login',
                      function: (){
                        if(formKey.currentState!.validate()){
                          print(emailControlar.text);

                        }
                      }),
                  SizedBox(
                    height: 10,
                  ),
                  defultButton(
                      radius: 15 ,
                      text: 'Regester',
                      background: Colors.red,
                      function: (){
                        if(formKey.currentState!.validate()){
                          print(passwordControlar.text);
                        }
                      }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Register Now',
                        ),
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
}