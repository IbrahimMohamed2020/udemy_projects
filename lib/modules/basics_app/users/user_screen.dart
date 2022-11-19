import 'package:abdallah_mansour/user/user_model.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatelessWidget {
  List<UserModel> user = [
    UserModel(
      name: 'Ibrahim Mohamed',
      phone: '+97253812210',
      id: 1,
    ),
    UserModel(
      name: 'Abood Mohamed',
      phone: '+97252277651',
      id: 2,
    ),
    UserModel(
      name: 'Hassan Mohamed',
      phone: '+97253815230',
      id: 3,
    ),
    UserModel(
      name: 'Ramy Mohamed',
      phone: '+97253666210',
      id: 4,
    ),
    UserModel(
      name: 'Yassen Mohamed',
      phone: '+97258812210',
      id: 5,
    ),
    UserModel(
      name: 'Anas Mohamed',
      phone: '+97253222210',
      id: 6,
    ),
    UserModel(
      name: 'Ahmaed Mohamed',
      phone: '+97253444410',
      id: 7,
    ),
    UserModel(
      name: 'Ali Mohamed',
      phone: '+97253812210',
      id: 8,
    ),
    UserModel(
      name: 'Moaz Mohamed',
      phone: '+97253812210',
      id: 9,
    ),
    UserModel(
      name: 'Ramy Mohamed',
      phone: '+97253666210',
      id: 4,
    ),
    UserModel(
      name: 'Yassen Mohamed',
      phone: '+97258812210',
      id: 5,
    ),
    UserModel(
      name: 'Anas Mohamed',
      phone: '+97253222210',
      id: 6,
    ),
    UserModel(
      name: 'Ahmaed Mohamed',
      phone: '+97253444410',
      id: 7,
    ),
    UserModel(
      name: 'Ali Mohamed',
      phone: '+97253812210',
      id: 8,
    ),
    UserModel(
      name: 'Moaz Mohamed',
      phone: '+97253812210',
      id: 9,
    ),



  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        title: Text('Users'),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => buildUserItem(user[index]),
        separatorBuilder: (context, index) => Padding(
          padding: const EdgeInsetsDirectional.only(start: 20,),
          child: Container(
            height: 1,
            width: double.infinity,
            color: Colors.grey[300],

          ),
        ),
        itemCount: user.length,
      ),
    );
  }



  Widget buildUserItem(UserModel user) => Padding(
    padding: const EdgeInsets.all(10),
    child: Row(
        children: [
          CircleAvatar(
            radius: 21,
            child: Text('${user.id}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

          ),
          SizedBox(
            width: 25,
          ),
          Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${user.name}',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),),
                Text('${user.phone}',
                  style: TextStyle(
                    color: Colors.grey,
                  ),),
              ]
          ),
        ]
    ),
  ) ;
}
