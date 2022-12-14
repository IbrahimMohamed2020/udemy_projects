import 'package:abdallah_mansour/modules/counter_app/cubit/cubit.dart';
import 'package:abdallah_mansour/modules/counter_app/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      /// هنا تم إنشاء البلوك
      create: (BuildContext context) => CounterCubit(),
      child: BlocConsumer<CounterCubit, CounterState>(
        listener: (context, state) {
          if (state is CounterInitialState) {
            print ("initial state ");
          }
          if (state is CounterMinusState) {
            /// هنا قمن بإستحدام الستيت لأنها أوبجيكت من نوع الكوينتر ماينوس
            print("minus state ${state.counter}");
          }
          if (state is CounterPluseState) {
            print ("plus state ${state.counter}");
          }
        },
        builder: (context, state){
          return  Scaffold(
            appBar: AppBar(
              title: Text('Hello'),
            ),
            body: Center(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed:(){
                        CounterCubit.get(context).minus();

                      },
                      child: Text('Minus',),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text("${CounterCubit.get(context).counter}",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),),
                    ),
                    TextButton(
                      onPressed: (){
                        CounterCubit.get(context).plus();

                      },
                      child: Text('Plus'),
                    ),
                  ]),
            ),
          );
        },
      ),
    );
  }
}
