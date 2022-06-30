import 'package:algoriza_intern_task1/config/theme/apptheme.dart';
import 'package:algoriza_intern_task1/utils/appcolors.dart';
import 'package:algoriza_intern_task1/utils/appstrings.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:hexcolor/hexcolor.dart';

import '../shared/component.dart';

class OnBoardingModel {
  final String image;
  final String titleText;
  final String bodyText;

  OnBoardingModel({
    required this.image,
    required this.titleText,
    required this.bodyText,
  });
}
class OnBoardingScreen extends StatefulWidget {

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  bool isLast=false;
  var pageController = PageController();
  List<OnBoardingModel> onBoard=[
    OnBoardingModel(
      image:'assets/images/1.png',
      bodyText: 'Learn How To Connect Serviers And More About Network',
      titleText:'Learn More About Computer Fields' ,

    ),
    OnBoardingModel(
      image:'assets/images/2.png',
      bodyText: 'We will provide you with a calm atmosphere full of enthusiasm',
      titleText:'You will learn how to bring out your hidden talents' ,

    ),
    OnBoardingModel(
      image:'assets/images/3.png',
      bodyText: 'We will learn you how to deal with data till you play with data like a small children',
      titleText:'data analysis' ,

    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child:defaultTextButton(
                text: 'Skip',
                function: (){
                  Navigator.pushNamed(context, 'login');
                }
              ),
            ),
            Expanded(
              child:PageView.builder(
                controller: pageController,
                physics:BouncingScrollPhysics(),
                onPageChanged: (int index){
                  if(index==onBoard.length-1){
                    setState(() {
                      isLast=true;
                      print(' Last');
                    });
                  }else {
                    setState(() {
                      isLast = false;
                      print('not Last');
                    });
                  }
                },
                itemBuilder: (context,index)=>buildSreenItem(onBoard[index]),
                itemCount: onBoard.length,),),
            SizedBox(height: 50,),
            Column(
              children: [
                SmoothPageIndicator(
                    controller: pageController,
                    count: onBoard.length,
                    effect: ExpandingDotsEffect(
                      dotColor:HexColor("#aecdb8"),
                      activeDotColor: HexColor('##2f383f'),
                      dotHeight: 10,
                      expansionFactor: 4,
                      dotWidth: 15,
                      spacing: 5,
                    )
                ),
                SizedBox(height: 20,),
               defaultButton(function: (){
                 if(isLast==true){
                   Navigator.pushNamed(context, 'login');
                 }else{
                   pageController.nextPage(
                       duration: Duration(
                         microseconds: 750,
                       ),
                       curve:Curves.fastLinearToSlowEaseIn);
                 }
               }, text:'Get Started'),
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Dont have account?',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                    ),
                   defaultTextButton(
                       function: (){
                         Navigator.pushNamed(context, 'register');
                       },
                       text: 'SignUp')
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  Widget buildSreenItem(OnBoardingModel model)=>Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Expanded(child:Image(
        image: AssetImage('${model.image}'),

      ),),
      Text('${model.titleText}',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
          color: Colors.black,
          fontFamily:'candy',
        ),),
      SizedBox(height: 15,),
      Text('${model.bodyText}',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 14,
          color: Colors.grey,
        ),),
    ],
  );
}