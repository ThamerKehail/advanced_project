import 'package:advanced_project/presentation/resources/assets_manager.dart';
import 'package:advanced_project/presentation/resources/color_manager.dart';
import 'package:advanced_project/presentation/resources/routes_manager.dart';
import 'package:advanced_project/presentation/resources/strings_manager.dart';
import 'package:advanced_project/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  late List<SliderObject> _list = _getSliderData();
  int _currentIndex = 0;

  _getSliderData() => [
    SliderObject(
      StringsManager.onBoardingTitle1,
      StringsManager.onBoardingSubTitle1,
      ImagesAssets.onBoardingLogo1,
    ),
    SliderObject(
      StringsManager.onBoardingTitle2,
      StringsManager.onBoardingSubTitle2,
      ImagesAssets.onBoardingLogo2,
    ),
    SliderObject(
      StringsManager.onBoardingTitle3,
      StringsManager.onBoardingSubTitle3,
      ImagesAssets.onBoardingLogo3,
    ),
    SliderObject(
      StringsManager.onBoardingTitle4,
      StringsManager.onBoardingSubTitle4,
      ImagesAssets.onBoardingLogo4,
    ),
  ];
  PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: _list.length,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        itemBuilder: (context, index) => OnboardingPage(_list[index]),
      ),
      bottomSheet: Container(
        color: Colors.white,
        // height: AppSize.s120,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Routes.loginRoute);
                },
                child: Text(
                  StringsManager.skip,
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.end,
                ),
              ),
            ),
            _getBottomSheetWidget(),
          ],
        ),
      ),
    );
  }

  Container _getBottomSheetWidget() {
    return Container(
      color: ColorManager.primary,
      child: Padding(
        padding: const EdgeInsets.only(bottom: AppPadding.p8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(AppPadding.p14),
              child: GestureDetector(
                 onTap: () {
                  _pageController.animateToPage(
                    _currentIndex - 1,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.bounceInOut,
                  );
                },
                child: SizedBox(
                  width: AppSize.s20,
                  height: AppSize.s20,
                  child: SvgPicture.asset(
                    ImagesAssets.leftArrowIc,
                    colorFilter: _currentIndex == 0
                        ? ColorFilter.mode(ColorManager.grey, BlendMode.srcIn)
                        : ColorFilter.mode(ColorManager.white, BlendMode.srcIn),
                  ),
                ),
              ),
            ),
            Row(
              children: List.generate(
                _list.length,
                (index) => Padding(
                  padding: const EdgeInsets.all(AppPadding.p8),
                  child: SvgPicture.asset(
                    index == _currentIndex
                        ? ImagesAssets.solidCircleIc
                        : ImagesAssets.hollowCircleIc,
                    width: AppSize.s12,
                    height: AppSize.s12,
                    colorFilter: ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppPadding.p14),
              child: GestureDetector(
                onTap: () {
                  _pageController.animateToPage(
                    _currentIndex + 1,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.bounceInOut,
                  );
                  // Navigate to the next page
                  if (_currentIndex == _list.length - 1) {
                    Navigator.pushReplacementNamed(context, Routes.loginRoute);
                  }
                },
                child: SizedBox(
                  width: AppSize.s20,
                  height: AppSize.s20,
                  child: SvgPicture.asset(
                    ImagesAssets.rightArrowIc,
                    colorFilter: _currentIndex == _list.length - 1
                        ? ColorFilter.mode(ColorManager.grey, BlendMode.srcIn)
                        : ColorFilter.mode(ColorManager.white, BlendMode.srcIn),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final SliderObject sliderObject;

  const OnboardingPage(this.sliderObject, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: AppSize.s40),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            sliderObject.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            sliderObject.subTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        SvgPicture.asset(sliderObject.image),
      ],
    );
  }
}

class SliderObject {
  final String title;
  final String subTitle;
  final String image;

  SliderObject(this.title, this.subTitle, this.image);
}
