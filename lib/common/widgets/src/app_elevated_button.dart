import 'package:flutter/material.dart';
import 'package:wesplit/common/common.dart';
import 'package:wesplit/gen/colors.gen.dart';

class AppElevatedButton extends StatelessWidget {
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final Color? textColor;
  final Size? fixedSize;
  final VoidCallback? onPressed;
  final Widget? child;
  final EdgeInsets? padding;
  final Color? shadowColor;
  final OutlinedBorder? shape;
  final bool needClipOval;
  final TextAlign? textAlign;
  final BorderSide? side;
  final Color? borderColor;
  final double? borderWidth;
  final double? textSize;
  final double? minimumWidth;
  final double? elevation;
  final TextStyle? textStyle;

  const AppElevatedButton(
      {required this.onPressed,
      this.backgroundColor,
      this.borderRadius,
      this.textColor = ColorName.grayer6c757d,
      super.key,
      this.textAlign,
      this.fixedSize,
      this.textSize,
      this.shape,
      this.padding,
      this.needClipOval = false,
      this.child,
      this.shadowColor,
      this.side,
      this.borderColor,
      this.elevation,
      this.borderWidth,
      this.textStyle,
      this.minimumWidth});

  factory AppElevatedButton.text({
    required VoidCallback? onPressed,
    Color? backgroundColor,
    Color? textColor,
    Size? fixedSize,
    double? textSize,
    BorderRadius? borderRadius,
    EdgeInsets? padding,
    TextAlign? textAlign,
    required String text,
    BorderSide? side,
  }) = _AppElevatedButtonWithText;

  factory AppElevatedButton.circular(
      {required VoidCallback? onPressed,
      Color? backgroundColor,
      Color? textColor,
      required double radius,
      EdgeInsets? padding,
      required Widget child,
      Color? borderColor,
      double? borderWidth}) = _AppElevatedButtonWithCircular;

  factory AppElevatedButton.icon(
      {required VoidCallback? onPressed,
      double? minimumWidth,
      BorderRadius? borderRadius,
      Color? backgroundColor,
      Color? textColor,
      String? text,
      Widget? rightChild,
      Size? fixedSize,
      required Widget icon,
      BorderSide? side,
      EdgeInsets? padding}) = _AppElevatedButtonWithIcon;

  factory AppElevatedButton.trailingIcon(
      {required VoidCallback? onPressed,
      BorderRadius? borderRadius,
      Color? backgroundColor,
      Color? textColor,
      required String text,
      Size? fixedSize,
      required Widget icon,
      BorderSide? side,
      EdgeInsets? padding,
      TextStyle? textStyle}) = _AppElevatedButtonWithTrailingIcon;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    Widget button = ElevatedButtonTheme(
      data: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor ?? colorScheme.primaryContainer,
              shape: shape ??
                  RoundedRectangleBorder(
                      side: side ?? const BorderSide(color: Colors.transparent),
                      borderRadius: borderRadius ?? BorderRadius.circular(10)),
              fixedSize: fixedSize ?? const Size(AppSize.s110, AppSize.s40),
              minimumSize: minimumWidth != null
                  ? Size(minimumWidth!, AppSize.s40)
                  : null,
              foregroundColor: textColor,
              elevation: elevation,
              padding: padding)),
      child: ElevatedButton(
          clipBehavior: Clip.antiAlias, onPressed: onPressed, child: child),
    );

    if (needClipOval) {
      return ClipOval(
        child: button,
      );
    }

    return button;
  }
}

class _AppElevatedButtonWithText extends AppElevatedButton {
  _AppElevatedButtonWithText({
    super.onPressed,
    required String text,
    super.backgroundColor,
    super.borderRadius,
    super.textColor,
    super.textAlign,
    super.padding,
    super.textSize,
    super.fixedSize,
    super.side,
  }) : super(
            child: _AppElevatedButtonWithTextChild(
          text: text,
          textSize: textSize,
          textAlign: textAlign,
          textColor: textColor,
        ));
}

class _AppElevatedButtonWithTextChild extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final Color? textColor;
  final double? textSize;
  const _AppElevatedButtonWithTextChild(
      {required this.text, this.textSize, this.textAlign, this.textColor});
  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: textAlign ?? TextAlign.center,
        style: getMediumStyle(fontSize: textSize ?? 15, color: textColor!));
  }
}

class _AppElevatedButtonWithIcon extends AppElevatedButton {
  _AppElevatedButtonWithIcon(
      {super.onPressed,
      String? text,
      Widget? rightChild,
      super.minimumWidth,
      super.borderRadius,
      super.backgroundColor,
      super.textColor,
      super.fixedSize,
      super.padding,
      required Widget icon,
      super.side})
      : super(
            child: _AppElevatedButtonWithIconChild(
          minimumWidth: minimumWidth,
          rightChild: rightChild,
          text: text,
          icon: icon,
          side: side,
          textColor: textColor,
        ));
}

class _AppElevatedButtonWithIconChild extends StatelessWidget {
  final String? text;
  final double? minimumWidth;
  final Widget? rightChild;
  final Widget icon;
  final BorderSide? side;
  final Color? textColor;
  const _AppElevatedButtonWithIconChild(
      {this.text,
      required this.icon,
      this.side,
      this.textColor,
      this.rightChild,
      this.minimumWidth});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            flex: 2,
            child: Align(alignment: Alignment.centerRight, child: icon)),
        const Expanded(
          flex: 1,
          child: SizedBox(),
        ),
        text == null
            ? Expanded(flex: 6, child: rightChild!)
            : Expanded(
                flex: 6,
                child: Container(
                  alignment: Alignment.center,
                  width: AppSize.s100,
                  child: Text(
                    text!,
                    style: getBoldStyle(
                        fontSize: 17.0,
                        color: textColor ?? ColorName.grayer6c757d),
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
      ],
    );
  }
}

class _AppElevatedButtonWithCircular extends AppElevatedButton {
  _AppElevatedButtonWithCircular(
      {super.onPressed,
      super.backgroundColor,
      super.textColor,
      required double radius,
      super.padding = EdgeInsets.zero,
      super.borderColor,
      super.borderWidth,
      super.child})
      : super(
          needClipOval: true,
          shape: CircleBorder(
              side: BorderSide(
                  color: borderColor ?? ColorName.black,
                  width: borderWidth ?? 1)),
          fixedSize: Size(radius * 2, radius * 2),
        );
}

class _AppElevatedButtonWithTrailingIcon extends AppElevatedButton {
  _AppElevatedButtonWithTrailingIcon(
      {super.onPressed,
      required String text,
      super.borderRadius,
      super.backgroundColor,
      super.textColor,
      super.fixedSize,
      super.padding,
      super.side,
      super.textStyle,
      required Widget icon})
      : super(
            child: _AppElevatedButtonWithTrailingIconChild(
                text: text, icon: icon, side: side, textStyle: textStyle));
}

class _AppElevatedButtonWithTrailingIconChild extends StatelessWidget {
  final String text;
  final Widget icon;
  final BorderSide? side;
  final TextStyle? textStyle;

  const _AppElevatedButtonWithTrailingIconChild(
      {required this.text, required this.icon, this.side, this.textStyle});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: textStyle,
          softWrap: true,
          maxLines: 2,
        ),
        icon,
      ],
    );
  }
}
