import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:mycoolpizzaapp/providers/onboarding_provider.dart';
import 'package:provider/provider.dart';

class FirstOnboarding extends StatelessWidget {
  const FirstOnboarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Consumer<OnboardingProvider>(
      builder: (context, onboarding, _) {
        return Column(
          children: [
            Container(
              height: size.height / 2,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Center(
                child: CircleAvatar(
                  radius: size.width / 4,
                ),
              ),
            ),
            SizedBox(height: 20),
            Column(
              children: [
                Text(
                  'Lorem ipsum is a dummy text used by newspapers as a sample text for for testing their printing',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 40),
                Container(
                  width: 100,
                  height: 30,
                  decoration: BoxDecoration(
                      // color: Colors.red,
                      // border: Border.all(),
                      ),
                  child: Center(
                    child: DotsIndicator(
                      dotsCount: onboarding.dotsCount,
                      position: onboarding.currentTab,
                      decorator: DotsDecorator(
                        activeColor: Colors.red,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40),
              ],
            ),
          ],
        );
      },
    );
  }
}
