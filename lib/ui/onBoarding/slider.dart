import 'package:fashion_ecommerce/data/model/on_boarding_entity.dart';
import 'package:fashion_ecommerce/ui/light_theme_color.dart';
import 'package:flutter/material.dart';

import '../../common/utils.dart';

class OnBoardingSlider extends StatefulWidget {
  final List<OnBoardingEntity> onBoardingEntity;
  final PageController pageController;

  const OnBoardingSlider(
      {super.key,
      required this.onBoardingEntity,
      required this.pageController});

  @override
  State<OnBoardingSlider> createState() => _OnBoardingSliderState();
}

class _OnBoardingSliderState extends State<OnBoardingSlider> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: SizedBox(
        height: 800,
        child: PageView.builder(
            controller: widget.pageController,
            itemCount: widget.onBoardingEntity.length,
            physics: defaultScrollPhysics,
            itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(left: 12, right: 12),
                child: _OnBoardingItem(
                    onBoardingEntity: widget.onBoardingEntity[index]))),
      ),
    );
  }
}

class _OnBoardingItem extends StatelessWidget {
  const _OnBoardingItem({
    super.key,
    required this.onBoardingEntity,
  });

  final OnBoardingEntity onBoardingEntity;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Column(
      children: [
        SizedBox(
          height: 400,
          child: Image.asset(onBoardingEntity.image)),
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 50, 24, 12),
          child: Text(onBoardingEntity.title,
              textAlign: TextAlign.center,
              style: themeData.textTheme.titleLarge?.copyWith(
                  color: LightThemeColor.primaryTextColor,
                  fontSize: 32,
                  fontWeight: FontWeight.bold)),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
          child: Text(onBoardingEntity.subtitle,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: themeData.textTheme.titleLarge?.copyWith(
                  color: LightThemeColor.secondaryTextColor,
                  fontSize: 24,
                  fontWeight: FontWeight.normal)),
        )
      ],
    );
  }
}
