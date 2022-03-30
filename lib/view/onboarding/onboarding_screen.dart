import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:mycoolpizzaapp/view/onboarding/onboarding_screen/first_onboarding.dart';
import 'package:mycoolpizzaapp/view/onboarding/onboarding_screen/second_onboarding.dart';
import 'package:mycoolpizzaapp/view/onboarding/onboarding_screen/third_onboarding.dart';
import 'package:mycoolpizzaapp/providers/onboarding_provider.dart';
import 'package:provider/provider.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Consumer<OnboardingProvider>(
      builder: (context, onboarding, _) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.red,
            automaticallyImplyLeading: false,
            title: Row(
              children: [
                Visibility(
                  visible: onboarding.currentTab != 0,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    onPressed: () {
                      onboarding.jumpToPreviousPage();
                    },
                    color: Colors.white,
                    child: Text('Back'),
                  ),
                ),
              ],
            ),
          ),
          body: Consumer<OnboardingProvider>(
            builder: (context, onboarding, _) {
              return PageView(
                controller: onboarding.pageController,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  FirstOnboarding(),
                  SecondOnboarding(),
                  ThirdOnboarding(),
                ],
              );
            },
          ),
          bottomNavigationBar: SizedBox(
            height: 100,
            child: Container(
              width: size.width,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  // CircleAvatar(
                  //   child: Icon(Icons.arrow_back_ios),
                  // ),
                  // SizedBox(
                  //   width: 10,
                  // ),
                  InkWell(
                    onTap: () {
                      onboarding.jumpToNextPage(context);
                    },
                    child: Container(
                      width: size.width - 40,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Text(
                          onboarding.currentTab == 2 ? 'Finish' : 'Next',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
