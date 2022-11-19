// ignore_for_file: prefer_const_constructors

import 'package:abdallah_mansour/modules/shop_app/login/shop_login_screen.dart';
import 'package:abdallah_mansour/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BordingModel{
  String image;
  String title;
  String body;

  BordingModel({
    required  this.image,
    required  this.title,
    required  this.body,
  });
}


// My names is Ibrahim



class onBordingScreen extends StatelessWidget {
  var borderControler = PageController();
  List<BordingModel> bording = [
    BordingModel(
      image: 'assets/images/shop4.png',
      title: 'on bord title 1',
      body: 'on bord body 1',
    ),
    BordingModel(
        image: 'assets/images/shop3.png',
        title: 'on bord title 2',
        body: 'on bord body 2'),
    BordingModel(
        image: 'assets/images/shop5.png',
        title: 'on bord title 3',
        body: 'on bord body 3')
  ];

  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: (){
                navigatAndFinish(ShopLoginScreen(),
                  context,
                );
              },
              child: Text('SKIP'),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              /// تقوم بإنشاء list على شكل scroll يعني تقوم ببناء العنصر عندما نعمل scroll
              child: PageView.builder(
                controller: borderControler,
                /// حتى يتم إخفاء اللون الذي يظهر عند سحب آخر screen
                physics:  BouncingScrollPhysics(),
                itemBuilder: (context, index) => buildBordingItem(bording[index]),
                itemCount: bording.length,
                /// تقوم بإرجاع index الذي وصلنا له ونحن نعمل scroll
                onPageChanged: (index){
                  if(index == bording.length-1){
                    isLast = true;
                  }else{
                    isLast = false;
                  }
                },
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: borderControler,
                  count: bording.length,
                  /// تصميم smoth و له عدة أشكال
                  effect: ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    dotHeight: 15,
                    dotWidth: 15,
                    expansionFactor: 5,
                    spacing: 5,
                    radius: 10,
                    activeDotColor: Colors.cyan,
                  ),
                ),
                /// تقوم بإنشاء مسافة بين عنصرين يعني تجعل المسافة بينهم flixable
                Spacer(),
                FloatingActionButton(
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                  onPressed: (){
                    if(isLast == false){
                      borderControler.nextPage(
                        ///مدة التنقل بين كل screen والأخرى
                        duration: Duration(
                          /// الزمن بوحدة millisecond
                          milliseconds: 750,
                        ),
                        /// شكل التنقل بين كل شاشة والأخرى
                        curve: Curves.easeInOutBack,
                      );
                    }else{
                      navigatAndFinish(ShopLoginScreen(),
                          context,
                      );
                    }

                  },

                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBordingItem(BordingModel model) =>  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        flex: 2,
        child: Image(
          image: AssetImage('${model.image}'),
        ),
      ),
      SizedBox(
        height: 30,
      ),
      Text(
        '${model.title}',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(
        height: 15,
      ),
      Text(
        '${model.body}',
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),

    ],
  );

}
