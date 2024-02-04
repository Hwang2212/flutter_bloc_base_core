import 'package:flutter/material.dart';
import 'package:wesplit/common/themes/themes_extensions.dart';
import 'package:wesplit/gen/colors.gen.dart';

import 'app_ui_constants.dart';

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

    // //Icon Theme
    // iconTheme: IconThemeData(color: colorScheme.onPrimary),
    // canvasColor: colorScheme.background,
    // scaffoldBackgroundColor: colorScheme.background,
    // highlightColor: Colors.transparent,
    // focusColor: focusColor,

    // //Elevated Button Theme
    // elevatedButtonTheme: ElevatedButtonThemeData(
    //     style: ElevatedButton.styleFrom(
    //         elevation: 0,
    //         disabledForegroundColor: colorScheme.onBackground,
    //         disabledBackgroundColor: colorScheme.shadow,
    //         // shadowColor: Colors.transparent,
    //         backgroundColor: colorScheme.primaryContainer,
    //         shape:
    //             RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    //         textStyle:
    //             getMediumStyle(fontSize: 14, color: colorScheme.onBackground),
    //         foregroundColor: colorScheme.onPrimary)),

    // // Outline Button Theme
    // outlinedButtonTheme: OutlinedButtonThemeData(
    //     style: OutlinedButton.styleFrom(
    //   disabledForegroundColor: colorScheme.onBackground,
    //   disabledBackgroundColor: colorScheme.shadow,
    //   shadowColor: Colors.transparent,
    //   backgroundColor: colorScheme.onBackground,
    //   side: const BorderSide(color: AppColors.greYer),
    //   shape: RoundedRectangleBorder(
    //       side: const BorderSide(color: AppColors.black, width: 10),
    //       borderRadius: BorderRadius.circular(10)),
    //   fixedSize: const Size(AppSize.s110, AppSize.s40),
    //   foregroundColor: colorScheme.primaryContainer,
    // )),

    // // AppBar Theme
    // appBarTheme: AppBarTheme(
    //   backgroundColor: colorScheme.background,
    //   elevation: 0,
    //   iconTheme: IconThemeData(color: colorScheme.primary),
    // ),

    // // Snackbar Theme
    // snackBarTheme: SnackBarThemeData(
    //     actionTextColor: colorScheme.onBackground,
    //     behavior: SnackBarBehavior.floating,
    //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    //     backgroundColor: colorScheme.secondaryContainer,
    //     contentTextStyle:
    //         getMediumStyle(color: colorScheme.onBackground, fontSize: 15)),

    // // Input Decoration Theme
    // inputDecorationTheme: InputDecorationTheme(
    //     errorStyle: getLightStyle(fontSize: FontSize.s16)
    //         .copyWith(color: colorScheme.secondary),
    //     labelStyle:
    //         getMediumStyle(fontSize: 14.0, color: colorScheme.primaryContainer),
    //     errorBorder: UnderlineInputBorder(
    //         borderSide: BorderSide(color: colorScheme.secondary)),
    //     focusedBorder: UnderlineInputBorder(
    //         borderSide:
    //             BorderSide(color: colorScheme.primaryContainer, width: 2)),
    //     border: UnderlineInputBorder(
    //         borderSide:
    //             BorderSide(color: colorScheme.primaryContainer, width: 2))),

    // //TabBarTheme
    // tabBarTheme: TabBarTheme(
    //     indicator: BoxDecoration(
    //         color: colorScheme.primaryContainer,
    //         borderRadius: BorderRadius.circular(100)),
    //     labelStyle:
    //         getMediumStyle(color: colorScheme.onBackground, fontSize: 16),
    //     unselectedLabelStyle: getMediumStyle(
    //         color: colorScheme.primaryContainer.withOpacity(0.5),
    //         fontSize: FontSize.s14),
    //     unselectedLabelColor: colorScheme.primaryContainer.withOpacity(0.5)),
  );

  static const _lightAppColors = WeSplitColorThemes(
    primaryColor: ColorName.darkerGray343a40,
    secondaryColor: ColorName.white,
    tertiaryColor: ColorName.darkerGray343a40,
    neutralColor: ColorName.lightGrayCed4da,
  );

  //
  // Dark theme
  //

  static final dark = ThemeData.dark().copyWith(
    extensions: [
      _darkAppColors,
    ],
  );

  static const _darkAppColors = WeSplitColorThemes(
    primaryColor: ColorName.darkerGray343a40,
    secondaryColor: ColorName.white,
    tertiaryColor: ColorName.darkerGray343a40,
    neutralColor: ColorName.lightGrayCed4da,
  );
}

extension AppThemeExtension on ThemeData {
  /// Usage example: Theme.of(context).appColors;
  WeSplitColorThemes get appColors =>
      extension<WeSplitColorThemes>() ?? AppTheme._lightAppColors;
}
