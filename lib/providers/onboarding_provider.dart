import 'package:flutter/material.dart';
import 'package:mycoolpizzaapp/view/home.dart';

class OnboardingProvider extends ChangeNotifier {
  PageController pageController = PageController();

  int dotsCount = 3;
  double currentTab = 0;

  void jumpToPreviousPage() {
    decreaseTab();
    pageController.jumpToPage(
      currentTab.toInt(),
    );
  }

  void jumpToNextPage(BuildContext context) {
    if (currentTab == 2) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return Home();
          },
        ),
      );
    } else {
      increaseTab();
      pageController.jumpToPage(
        currentTab.toInt(),
      );
      print(currentTab);
    }
  }

  void increaseTab() {
    print(currentTab);

    if (currentTab < 2) {
      currentTab++;
      notifyListeners();
    }
  }

  void decreaseTab() {
    if (currentTab > 0) {
      currentTab--;
      notifyListeners();
    }
  }
}
