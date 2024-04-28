import 'package:flutter/material.dart';
import 'package:flutter_bloc_base/common/common.dart';
import 'package:flutter_bloc_base/gen/colors.gen.dart';

class AppTheme {
  //
  // Light theme
  //

  static final light = ThemeData.light().copyWith(
    extensions: [
      _lightAppColors,
    ],
    //CardTheme
    cardTheme: CardTheme(
      elevation: AppSize.s3,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s10)),
    ),

    //Icon Theme
    iconTheme: const IconThemeData(color: ColorName.grayAdb5bd),
    canvasColor: ColorName.white,
    scaffoldBackgroundColor: ColorName.white,
    highlightColor: Colors.transparent,
    focusColor: ColorName.white,

    // //Elevated Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            elevation: 0,
            disabledForegroundColor: ColorName.white,
            disabledBackgroundColor: ColorName.grayAdb5bd,
            // shadowColor: Colors.transparent,
            backgroundColor: ColorName.lightGrayCed4da,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            textStyle: getMediumStyle(fontSize: 14, color: ColorName.white),
            foregroundColor: ColorName.darkGray495057)),

    // // Outline Button Theme
    // outlinedButtonTheme: OutlinedButtonThemeData(
    //     style: OutlinedButton.styleFrom(
    //   disabledForegroundColor: ColorName.white,
    //   disabledBackgroundColor: colorScheme.shadow,
    //   shadowColor: Colors.transparent,
    //   backgroundColor: ColorName.white,
    //   side: const BorderSide(color: AppColors.greYer),
    //   shape: RoundedRectangleBorder(
    //       side: const BorderSide(color: AppColors.black, width: 10),
    //       borderRadius: BorderRadius.circular(10)),
    //   fixedSize: const Size(AppSize.s110, AppSize.s40),
    //   foregroundColor: ColorName.lightGrayCed4da,
    // )),

    // AppBar Theme
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorName.white,
      elevation: 0,
      iconTheme: IconThemeData(color: ColorName.white),
    ),

    // // Snackbar Theme
    // snackBarTheme: SnackBarThemeData(
    //     actionTextColor: ColorName.white,
    //     behavior: SnackBarBehavior.floating,
    //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    //     backgroundColor: colorScheme.secondaryContainer,
    //     contentTextStyle:
    //         getMediumStyle(color: ColorName.white, fontSize: 15)),

    // // Input Decoration Theme
    // inputDecorationTheme: InputDecorationTheme(
    //     errorStyle: getLightStyle(fontSize: FontSize.s16)
    //         .copyWith(color: colorScheme.secondary),
    //     labelStyle:
    //         getMediumStyle(fontSize: 14.0, color: ColorName.lightGrayCed4da),
    //     errorBorder: UnderlineInputBorder(
    //         borderSide: BorderSide(color: colorScheme.secondary)),
    //     focusedBorder: UnderlineInputBorder(
    //         borderSide:
    //             BorderSide(color: ColorName.lightGrayCed4da, width: 2)),
    //     border: UnderlineInputBorder(
    //         borderSide:
    //             BorderSide(color: ColorName.lightGrayCed4da, width: 2))),

    // //TabBarTheme
    // tabBarTheme: TabBarTheme(
    //     indicator: BoxDecoration(
    //         color: ColorName.lightGrayCed4da,
    //         borderRadius: BorderRadius.circular(100)),
    //     labelStyle:
    //         getMediumStyle(color: ColorName.white, fontSize: 16),
    //     unselectedLabelStyle: getMediumStyle(
    //         color: ColorName.lightGrayCed4da.withOpacity(0.5),
    //         fontSize: FontSize.s14),
    //     unselectedLabelColor: ColorName.lightGrayCed4da.withOpacity(0.5)),
  );

  static const _lightAppColors = AppColorThemes(
    primaryColor: ColorName.black,
    secondaryColor: ColorName.white,
    tertiaryColor: ColorName.black,
    neutralColor: ColorName.black,
  );

  //
  // Dark theme
  //

  static final dark = ThemeData.dark().copyWith(
    extensions: [
      _darkAppColors,
    ],
  );

  static const _darkAppColors = AppColorThemes(
    primaryColor: ColorName.darkerGray343a40,
    secondaryColor: ColorName.white,
    tertiaryColor: ColorName.darkerGray343a40,
    neutralColor: ColorName.lightGrayCed4da,
  );
}

extension AppThemeExtension on ThemeData {
  /// Usage example: Theme.of(context).appColors;
  AppColorThemes get appColors =>
      extension<AppColorThemes>() ?? AppTheme._lightAppColors;
}
