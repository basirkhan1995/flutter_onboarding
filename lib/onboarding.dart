
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_screen/Components/color.dart';
import 'package:flutter_onboarding_screen/Components/onboarding_data.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final controller = OnboardingData();
  final pageController = PageController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          body(),
          buildDots(),
          button(),
        ],
      ),
    );
  }

  //Body
  Widget body(){
    return Expanded(
      child: Center(
        child: PageView.builder(
            onPageChanged: (value){
              setState(() {
                currentIndex = value;
              });
            },
            itemCount: controller.items.length,
            itemBuilder: (context,index){
             return Padding(
               padding: const EdgeInsets.symmetric(horizontal: 20),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   //Images
                   Image.asset(controller.items[currentIndex].image),

                   const SizedBox(height: 15),
                   //Titles
                   Text(controller.items[currentIndex].title,
                     style: const TextStyle(fontSize: 25,color: primaryColor,fontWeight: FontWeight.bold),
                     textAlign: TextAlign.center,),

                   //Description
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 25),
                     child: Text(controller.items[currentIndex].description,
                       style: const TextStyle(color: Colors.grey,fontSize: 16),textAlign: TextAlign.center,),
                   ),

                 ],
               ),
             );
        }),
      ),
    );
  }

  //Dots
  Widget buildDots(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(controller.items.length, (index) => AnimatedContainer(
          margin: const EdgeInsets.symmetric(horizontal: 2),
          decoration:   BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: currentIndex == index? primaryColor : Colors.grey,
          ),
          height: 7,
          width: currentIndex == index? 30 : 7,
          duration: const Duration(milliseconds: 700))),
    );
  }

  //Button
  Widget button(){
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      width: MediaQuery.of(context).size.width *.9,
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: primaryColor
      ),

      child: TextButton(
        onPressed: (){
          setState(() {
            currentIndex != controller.items.length -1? currentIndex++ : null;
          });
        },
        child: Text(currentIndex == controller.items.length -1? "Get started" : "Continue",
          style: const TextStyle(color: Colors.white),),
      ),
    );
  }
}
