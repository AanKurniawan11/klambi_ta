import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:klambi_ta/Common/colors/color.dart';
import 'package:klambi_ta/Pages/onboarding/components/onboarding_item.dart';
import 'package:klambi_ta/Pages/user/register/page/register.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:get/get.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final controller = OnboardingItems();
  final pageController = PageController();
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    final Size mediaquery = MediaQuery.of(context).size;
    final double height = mediaquery.height;
    final double width = mediaquery.width;

    return Scaffold(
      bottomSheet: SafeArea(
        child: Container(
          color: ColorValue.kWhiteOB,
          height: 160,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: isLastPage
              ? Column(
            children: [
              getStarted(),
            ],
          )
              : Column(
            children: [
              ElevatedButton(
                onPressed: () => pageController.nextPage(
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.easeInOut,
                ),
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all(ColorValue.kPrimary),
                  minimumSize: MaterialStateProperty.all(
                      Size(width * 0.85, height * 0.065)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
                child: const Text(
                  "Lanjut",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SmoothPageIndicator(
                controller: pageController,
                count: controller.items.length,
                onDotClicked: (index) =>
                    pageController.animateToPage(index,
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.easeInOut),
                effect: const ExpandingDotsEffect(
                  dotHeight: 10,
                  dotWidth: 20,
                  activeDotColor: ColorValue.kPrimary,
                  dotColor: ColorValue.kLightGrey,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: PageView.builder(
              onPageChanged: (index) => setState(
                      () => isLastPage = controller.items.length - 1 == index),
              itemCount: controller.items.length,
              controller: pageController,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Add animation or transition effect to the image
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.easeInOut,
                      child: Image.asset(controller.items[index].image),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      controller.items[index].title,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: ColorValue.kPrimary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 15),
                    Text(
                      controller.items[index].description,
                      style: const TextStyle(
                        color: ColorValue.kDarkGrey,
                        fontSize: 16,
                      ),
                      maxLines: 5,
                      textAlign: TextAlign.center,
                    ),
                  ],
                );
              },
            ),
          ),
          Positioned(
            top: 25,
            right: 10,
            child: TextButton(
              onPressed: () =>
                  pageController.jumpToPage(controller.items.length - 1),
              child: const Text(
                "Skip",
                style: TextStyle(
                  color: ColorValue.kDarkGrey,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getStarted() {
    final Size mediaquery = MediaQuery.of(context).size;
    final double height = mediaquery.height;
    final double width = mediaquery.width;

    return ElevatedButton(
      onPressed: () async {
        final pres = await SharedPreferences.getInstance();
        pres.setBool("onboarding", true);
        if (!mounted) return;
        Get.offAll(Register());
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(ColorValue.kPrimary),
        minimumSize:
        MaterialStateProperty.all(Size(width * 0.85, height * 0.065)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ),
      child: const Text(
        "Mulai",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
      ),
    );
  }
}
