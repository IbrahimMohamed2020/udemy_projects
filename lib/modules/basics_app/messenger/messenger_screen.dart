import 'package:flutter/material.dart';

class MessengerScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 20,
        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('images/user.png'),
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              'Chats',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          CircleAvatar(
            radius: 15,
            backgroundColor: Colors.blue,
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.camera_alt,
                size: 15,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          CircleAvatar(
            radius: 15,
            backgroundColor: Colors.blue,
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.edit,
                color: Colors.white,
                size: 15,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      size: 20,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Search',
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 100,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => buildStoryItem(),
                  separatorBuilder: (context, index) => SizedBox(width: 20),
                  itemCount: 8,

                ),




              ),
              SizedBox(height: 20),
              ListView.separated(
                shrinkWrap: true,     /// تعني قم بإنشاء المصفوفة مرة واحد
                physics: NeverScrollableScrollPhysics(),  /// تعني لا تقم بعمل سكرول لإنه يوجد سكرول في الودجت الأساسية
                itemBuilder: (context, index) => buildChatItem(),
                separatorBuilder: (context, index) => SizedBox(height: 20),
                itemCount: 10,

              ),


            ],
          ),
        ),
      ),
    );
  }

  Widget buildChatItem() =>  Row(
    children: [
      Stack(
        alignment: Alignment.bottomRight,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('images/user.png'),
            radius: 30,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(
                bottom: 3, end: 3),
            child: CircleAvatar(
              backgroundColor: Colors.red,
              radius: 7,
            ),
          ),
        ],
      ),
      SizedBox(
        width: 20,
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ibrahim mohamed ibrahim al senwar, I am 23 years old, I am married',
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Hello my name is Ibrahim , Iam live in Palestine , Iam married',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10),
                  child: Container(
                    width: 7,
                    height: 7,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Text(
                  '02:00 pm',
                  maxLines: 1,
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );
  Widget buildStoryItem() => Row(
    children: [
      Container(
        width: 60,
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('images/user.png'),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                    bottom: 3,
                    end: 3,
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.red,
                    radius: 8,
                  ),
                ),
              ],
            ),
            SizedBox(height: 6),
            Text(
              'Ibrahim Mohamed Ibrahim Senwar',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),

    ],
  );
}
