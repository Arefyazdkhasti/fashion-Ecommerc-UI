import 'package:fashion_ecommerce/data/model/on_boarding_entity.dart';
import 'package:fashion_ecommerce/ui/light_theme_color.dart';
import 'package:fashion_ecommerce/ui/onBoarding/slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatefulWidget {

  OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final PageController pageController = PageController();

  final int maxPageIndex = 2;

  int currentPageIndex = 1;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    final List<OnBoardingEntity> onBoardingImages = [
      OnBoardingEntity(
        id: '1',
        image: 'assets/images/onBoarding1.jpg',
        title: 'No more boring things',
        subtitle: 'Picking up accessories from popular European Brands.',
      ),
      OnBoardingEntity(
        id: '2',
        image: 'assets/images/onBoarding2.jpg',
        title: 'Exploring the fashion trends',
        subtitle: 'We offer an assortment that follows fashion trends.',
      ),
    ];

    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(36),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 120,
              height: 65,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Skip',
                  textAlign: TextAlign.center,
                  style: themeData.textTheme.bodyMedium?.copyWith(
                    color: LightThemeColor.secondaryTextColor,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                if (currentPageIndex < maxPageIndex) {
                  setState(() {
                    currentPageIndex++;
                  });
                  pageController.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn,
                  );
                } else {
                  // Last page reached, do something else here
                }
              },
              child: Container(
                width: 120,
                height: 65,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: LightThemeColor.secondaryColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    currentPageIndex < maxPageIndex ? 'Next' : 'Start',
                    textAlign: TextAlign.center,
                    style: themeData.textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Positioned(
              left: 8,
              right: 8,
              top: 0,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: SmoothPageIndicator(
                  controller: pageController,
                  count: 2,
                  axisDirection: Axis.horizontal,
                  effect: WormEffect(
                    spacing: 8.0,
                    dotWidth: MediaQuery.of(context).size.width / 2 - 16,
                    dotHeight: 4.0,
                    paintStyle: PaintingStyle.fill,
                    strokeWidth: 0,
                    dotColor: Colors.grey.shade300,
                    activeDotColor: Colors.black,
                  ),
                ),
              ),
            ),
            OnBoardingSlider(
              onBoardingEntity: onBoardingImages,
              pageController: pageController,
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    // Add a listener to the page controller
    pageController.addListener(_handlePageChange);
  }

  @override
  void dispose() {
    // Remove the listener when the widget is disposed
    pageController.removeListener(_handlePageChange);
    super.dispose();
  }

  void _handlePageChange() {
    setState(() {
      currentPageIndex = pageController.page!.round() + 1;
    });
  }
}
