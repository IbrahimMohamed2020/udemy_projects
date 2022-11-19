// import 'package:abdallah_mansour/layout/news_app/cubit/cubit.dart';
// import 'package:abdallah_mansour/layout/news_app/cubit/states.dart';
// import 'package:abdallah_mansour/shared/components/components.dart';
// import 'package:conditional_builder/conditional_builder.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class  BuisnessScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//
//     return BlocConsumer<NewsCubit, NewsState>(
//       listener: (context, state){},
//       builder: (context, state)
//       {
//         var list = NewsCubit.get(context).buisness;
//         return  ConditionalBuilder(
//           condition: state is!  NewsGetBusinessLoadingState,
//           builder: (context) =>
//               ListView.separated(
//                 ///علشان لمن نسحب الشاشة لإعلى تنسحب
//                 physics: BouncingScrollPhysics(),
//                 itemBuilder: (context, index) => buildArticaleItem(list[index]),
//                 separatorBuilder: (context, index) => Container(
//                   width: double.infinity,
//                   height: 2,
//                   color: Colors.grey,
//                 ),
//                 itemCount: 10,
//               ),
//           fallback: (context) => Center(child: CircularProgressIndicator()),
//         );
//       },
//     );
//   }
// }
