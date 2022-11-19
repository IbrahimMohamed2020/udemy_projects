// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:abdallah_mansour/shared/cubit/cubit.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';

/// في هذه الصفحة يتم وضع العناصر التي تتكرر فمثلا يتم تعريف بعض ال widget التي تتكرر حتى نوفر الأكواد

Widget defultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUpperCase = true,
  double radius = 3,
  required Function function,
  required String text,

}) =>
    Container(
      width: width,
      height: 40 ,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: MaterialButton(
        height: 40,
        onPressed: ()
        {
          function();
        },
        child: Text(
          isUpperCase? text.toUpperCase() : text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );



Widget defultTextButton({
  required Function function,
  required Text text,
}) => TextButton(
    onPressed: function(),
    child: text,

);



Widget  defultTextFormFiled({
  required TextEditingController controller,
  required TextInputType types,
  Function? onSubmit,
  Function? onChange,
  required String lable,
  required IconData prefixIcon,
  //required String type,
  bool isPasswored = false,
  IconData? suffix,
  Function? suffixPressed,
  required Function validate,
  Function? onTap,

}) => TextFormField(
  obscureText: isPasswored,
  controller: controller,
  keyboardType: types,
  onFieldSubmitted: (s) {
    onSubmit;
  },
  onChanged: (s){
    onChange;
  },
  validator: (value) => validate(value!),

  onTap:(){
    onTap!();
  },

  decoration: InputDecoration(
    labelText: lable,
    border: const OutlineInputBorder(),
    prefixIcon: IconButton(
      onPressed: () {
        suffixPressed;
      },
      icon: Icon(prefixIcon), ),
    suffixIcon : suffix != null ? IconButton(
      onPressed:(){
        suffixPressed;
      },
      icon: Icon(
        suffix,
        color:  Colors.blue,
      ),
    ) : null ,
  ),

);



Widget tasksBuilder({
  required List<Map> tasks,
}) => ConditionalBuilder(
  condition: tasks.length > 0,
  builder: (context) => ListView.separated(
    itemBuilder: (context, index) => buildTaskItem(tasks[index], context),
    separatorBuilder: (context, index) => Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 15,
      ),
      child: Container(
        width: double.infinity,
        height: 1,
        color: Colors.grey,
      ),
    ),
    itemCount: tasks.length,
  ),
  fallback: (context) =>  Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.menu,
          size: 90,
          color: Colors.grey,
        ),
        const Text(
          'No Task Yet , Please Add Some Tasks',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    ),
  ),
);




Widget buildTaskItem(Map model, context) =>  Dismissible(
  key: Key(model['id'].toString()),
  background: Container(
    child: const Icon(
        size: 40,
        color: Colors.white,
        Icons.delete_forever,
    ),
        color: Colors.red,
  ),
  onDismissed: (DismissDirection){
    AppCubit.get(context).deletData(id: model['id']);
  },
  child:   Padding(
    padding: const EdgeInsets.all(10),
    child: Row(
      children: [
        CircleAvatar(
          radius: 40,
          child: Text('${model['time']}'),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${model['title']}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text('${model['date']}',
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ),

        const SizedBox(
          width: 20,
        ),
        IconButton(
          icon: const Icon(Icons.check_circle),
          onPressed: (){
            AppCubit.get(context).updateData(
              status: 'done',
              id: model['id'],
            );
          },
        ),
        IconButton(
          icon: const Icon(
            Icons.archive,
          ),
          onPressed: (){
            AppCubit.get(context).updateData(
              status: 'archive',
              id: model['id'],
            );
          },
        ),
      ],
    ),





  ),
);

Widget taskBuilder({
  required List <Map> task,
}) => ConditionalBuilder(
  condition: task.length > 0,
  builder: (context) => ListView.separated(
    itemBuilder: (context, index){
      return buildTaskItem(task[index], context);
    },
    separatorBuilder: (context, index) => Container(),
    itemCount: task.length,
  ),
  fallback: (context) => Container(),
);


Widget buildArticaleItem(artical) => InkWell(
  onTap:(){
    // navigatTo(
    //     context,
    //     WebViewScreen(artical['url']),
    // );
  },
  child:   Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Container(
            width: 120,
          height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
              image: NetworkImage('${artical['urlToImage']}'),
                fit: BoxFit.cover,
            ),
          ),
        ),
  
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Container(
            height: 120,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    '${artical['title']}',
                    // style: Theme.of(context).textTheme.bodyText1,
                    //  maxLines: 4,
                    //  overflow: TextOverflow.ellipsis,
                  ),
                ),
  
                Text('${artical['publishedAt']}',
                  // style: Theme.of(context).textTheme.bodyText1,
                  //   maxLines: 4,
                  //   overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  ),
);


void navigatTo(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);


void navigatAndFinish(context, widget) =>
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
            builder: (context) => widget,
        ),
            /// هل تريد الرجوع للصفحة السابقة
            (route) => false);






