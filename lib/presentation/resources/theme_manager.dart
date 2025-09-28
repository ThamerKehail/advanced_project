import 'package:advanced_project/presentation/resources/color_manager.dart';
import 'package:advanced_project/presentation/resources/font_manager.dart';
import 'package:advanced_project/presentation/resources/styles_manager.dart';
import 'package:advanced_project/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData getAppTheme() {
  return ThemeData(
    //main colors
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.lightPrimary,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,
    splashColor: ColorManager.lightPrimary, // ripple effect color
    // card view theme
    cardTheme: CardThemeData(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s4,
    ),
    // app bar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: ColorManager.white,
      elevation: AppSize.s0,
      shadowColor: ColorManager.lightPrimary,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: ColorManager.white,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ),
      titleTextStyle: getRegularStyle(
        fontSize: FontSize.s16,
        color: ColorManager.white,
      ),
    ),
    // button theme
    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: ColorManager.grey1,
      buttonColor: ColorManager.primary,
      splashColor: ColorManager.lightPrimary, // ripple effect color
    ),
    // elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularStyle(
          color: ColorManager.white,
          fontSize: FontSize.s17,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
        backgroundColor: ColorManager.primary,
        shadowColor: ColorManager.lightPrimary,
      ),
    ),
    // text theme
    textTheme: TextTheme(
      displayLarge: getLightStyle(
        color: ColorManager.darkGrey,
        fontSize: FontSize.s22,
      ),
      headlineLarge: getSemiBoldStyle(
        color: ColorManager.darkGrey,
        fontSize: FontSize.s16,
      ),
      titleMedium: getMediumStyle(
        color: ColorManager.primary,
        fontSize: FontSize.s16,
      ),
      bodyLarge: getRegularStyle(
        color: ColorManager.grey,
        fontSize: FontSize.s14,
      ),
      bodyMedium: getRegularStyle(
        color: ColorManager.grey,
        fontSize: FontSize.s12,
      ),
    ),
    // form input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      hintStyle: getRegularStyle(
        color: ColorManager.grey,
        fontSize: FontSize.s14,
      ),
      labelStyle: getMediumStyle(
        color: ColorManager.grey,
        fontSize: FontSize.s14,
      ),
      errorStyle: getRegularStyle(
        color: ColorManager.error,
        fontSize: FontSize.s14,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.grey, width: AppSize.s1_5),
        borderRadius: BorderRadius.circular(AppSize.s8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.primary,
          width: AppSize.s1_5,
        ),
        borderRadius: BorderRadius.circular(AppSize.s8),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.error, width: AppSize.s1_5),
        borderRadius: BorderRadius.circular(AppSize.s8),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.primary,
          width: AppSize.s1_5,
        ),
        borderRadius: BorderRadius.circular(AppSize.s8),
      ),
    ),
  );
}
