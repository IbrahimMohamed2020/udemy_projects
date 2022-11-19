// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Test extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ali'),
      ),
      body: Container(
        child: Image(
          width: 100,
          height: 200,
          image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkZIGujgWmCH7Yey0a8jMDX6AxwH84aR3AqEMDXrTdkSRrn-LT2jJqAJbUSqb5KzLT2VI&usqp=CAU',
          ),
        ),

      ),
    );
  }
}
