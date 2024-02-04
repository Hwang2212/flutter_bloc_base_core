import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;
import 'package:google_fonts/google_fonts.dart';
import 'package:material_color_utilities/material_color_utilities.dart';

@immutable
class WeSplitColorThemes extends ThemeExtension<WeSplitColorThemes> {
  const WeSplitColorThemes({
    required this.primaryColor,
    required this.secondaryColor,
    required this.tertiaryColor,
    required this.neutralColor,
  });
  final Color primaryColor, secondaryColor, tertiaryColor, neutralColor;

  @override
  ThemeExtension<WeSplitColorThemes> copyWith({
    Color? primaryColor,
    Color? secondaryColor,
    Color? tertiaryColor,
    Color? neutralColor,
  }) {
    return WeSplitColorThemes(
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      tertiaryColor: tertiaryColor ?? this.tertiaryColor,
      neutralColor: neutralColor ?? this.neutralColor,
    );
  }

  @override
  ThemeExtension<WeSplitColorThemes> lerp(
    covariant ThemeExtension<WeSplitColorThemes>? other,
    double t,
  ) {
    if (other is! WeSplitColorThemes) {
      return this;
    }

    return WeSplitColorThemes(
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t)!,
      secondaryColor: Color.lerp(secondaryColor, other.secondaryColor, t)!,
      tertiaryColor: Color.lerp(tertiaryColor, other.tertiaryColor, t)!,
      neutralColor: Color.lerp(neutralColor, other.neutralColor, t)!,
    );
  }

  ThemeData _baseTheme(ColorScheme colorScheme) {
    final isLight = colorScheme.brightness == Brightness.light;
    final primaryPoppinsTextTheme = GoogleFonts.poppinsTextTheme();
    final secondaryMontserratTextTheme = GoogleFonts.montserratTextTheme();
    final textTheme = primaryPoppinsTextTheme.copyWith(
      displaySmall: secondaryMontserratTextTheme.displaySmall,
    );
    return ThemeData(
      useMaterial3: true,
      extensions: [this],
      colorScheme: colorScheme,
      textTheme: textTheme,
      scaffoldBackgroundColor: isLight ? neutralColor : colorScheme.background,
    );
  }

  Scheme _scheme() {
    final base = CorePalette.of(primaryColor.value);
    final primary = base.primary;
    final secondary = CorePalette.of(secondaryColor.value).primary;
    final tertiary = CorePalette.of(tertiaryColor.value).primary;
    final neutral = CorePalette.of(neutralColor.value).neutral;
    const orderTone = 40;
    const onOrderTone = 100;
    const onOrderToneContainer = 10;
    const orderToneContainer = 90;
    // Current Order Tone Configurations are for Light Theme.
    // For Dark Theme, we must use other orderTone Values
    return Scheme(
      primary: primary.get(orderTone),
      onPrimary: primary.get(onOrderTone),
      primaryContainer: primary.get(orderToneContainer),
      onPrimaryContainer: primary.get(onOrderToneContainer),
      secondary: secondary.get(orderTone),
      onSecondary: secondary.get(onOrderTone),
      secondaryContainer: secondary.get(orderToneContainer),
      onSecondaryContainer: secondary.get(onOrderToneContainer),
      tertiary: tertiary.get(orderTone),
      onTertiary: tertiary.get(onOrderTone),
      tertiaryContainer: tertiary.get(orderToneContainer),
      onTertiaryContainer: tertiary.get(onOrderToneContainer),
      error: base.error.get(40),
      onError: base.error.get(100),
      errorContainer: base.error.get(90),
      onErrorContainer: base.error.get(10),
      background: neutral.get(99),
      onBackground: neutral.get(10),
      surface: neutral.get(99),
      onSurface: neutral.get(10),
      surfaceVariant: base.neutralVariant.get(orderToneContainer),
      onSurfaceVariant: base.neutralVariant.get(30),
      outline: base.neutralVariant.get(50),
      outlineVariant: base.neutralVariant.get(80),
      shadow: neutral.get(0),
      scrim: neutral.get(0),
      inverseSurface: neutral.get(20),
      inverseOnSurface: neutral.get(95),
      inversePrimary: primary.get(80),
    );
  }
}

extension SchemeExt on Scheme {
  ColorScheme toColorScheme(Brightness brightness) {
    return ColorScheme(
      brightness: brightness,
      primary: Color(primary),
      onPrimary: Color(onPrimary),
      secondary: Color(secondary),
      onSecondary: Color(onSecondary),
      error: Color(error),
      onError: Color(onError),
      background: Color(background),
      onBackground: Color(onBackground),
      surface: Color(surface),
      onSurface: Color(onSurface),
    );
  }
}

class ImageTheme extends StatelessWidget {
  const ImageTheme({
    required this.path,
    required this.child,
    super.key,
  });

  final String path;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return FutureBuilder(
        future: colorSchemeFromImage(theme.colorScheme, path),
        builder: (context, snapshot) {
          final scheme = snapshot.data ?? theme.colorScheme;
          return Theme(
            data: theme.copyWith(colorScheme: scheme),
            child: child,
          );
        });
  }

  Future<List<int>?> imageToPixels(String path) async {
    try {
      final data = await rootBundle.load(path);
      final image = img.PngDecoder().decode(data.buffer.asUint8List());
      if (image == null) return null;
      final bytes = image.getBytes(order: img.ChannelOrder.rgb);
      final pixels = <int>[];
      for (var i = 0; i < bytes.length; i += 3) {
        pixels.add(img.getRowStride(bytes[i], bytes[i + 1], img.Format.uint8));
      }
      return pixels;
    } catch (e) {
      debugPrint('Error Convert Image to Pixels: $e');
      return null;
    }
  }

  Future<List<Color>?> sourceColorsFromImage(String path) async {
    try {
      final pixels = await imageToPixels(path);
      if (pixels?.isEmpty ?? true) return null;
      final result = await QuantizerCelebi().quantize(pixels!.toList(), 128);
      final ranked = Score.score(result.colorToCount);
      return ranked.map((e) => Color(e)).toList();
    } catch (e) {
      return null;
    }
  }

  Future<ColorScheme> colorSchemeFromImage(
    ColorScheme base,
    String path,
  ) async {
    final colors = await sourceColorsFromImage(path);
    if (colors?.isEmpty ?? true) return base;
    final to = base.primary.value;
    final from = colors![0].value;
    final blended = Color(Blend.harmonize(from, to));
    final scheme = ColorScheme.fromSeed(seedColor: blended);
    return scheme;
  }
}
