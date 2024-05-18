import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:todolist/src/core/constants/q_constants.dart';

/// A button that shows a busy indicator in place of title
class QButton extends StatelessWidget {
  final bool busy;
  final bool enabled;
  final String? title;
  final Widget? child;
  final VoidCallback? onPressed;
  final bool withHorizontalPadding;
  final bool withVerticalPadding;
  final double? width;
  final double? height;
  final double? hPadding;
  final double? vPadding;
  final bool showLoadingWidget;
  final Color? backgroundColor;
  final double? titleSize;
  final TextStyle? titleStyle;
  final BorderRadiusGeometry? radius;

  const QButton({
    this.onPressed,
    this.title,
    this.titleSize,
    this.child,
    this.hPadding,
    this.vPadding,
    this.busy = false,
    this.enabled = true,
    this.titleStyle,
    super.key,
    this.withVerticalPadding = true,
    this.withHorizontalPadding = true,
    this.width,
    this.height,
    this.showLoadingWidget = true,
    this.radius,
    this.backgroundColor = const Color(0xff5AE25A),
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          shape: MaterialStateProperty.all(ContinuousRectangleBorder(
              borderRadius:
                  radius ?? const BorderRadius.all(Radius.circular(5)))),
          backgroundColor: enabled
              ? MaterialStateProperty.all(backgroundColor)
              : MaterialStateProperty.all(backgroundColor!.withOpacity(0.4))),
      onPressed: enabled && !busy
          ? () {
              if (onPressed != null || busy == false) {
                onPressed?.call();
              }
            }
          : null,
      child: XBusyTitle(
        busy: busy,
        width: width,
        height: height,
        titleStyle: titleStyle,
        hPadding: hPadding,
        vPadding: vPadding,
        title: title,
        withVerticalPadding: withVerticalPadding,
        withHorizontalPadding: withHorizontalPadding,
        showLoadingWidget: showLoadingWidget,
        child: child,
      ),
    );
  }
}

class XBusyTitle extends StatelessWidget {
  final bool busy;
  final String? title;
  final Widget? child;
  final bool withHorizontalPadding;
  final bool withVerticalPadding;
  final double? width;
  final double? hPadding;
  final double? vPadding;
  final double? height;
  final bool showLoadingWidget;
  final TextStyle? titleStyle;

  const XBusyTitle({
    this.title,
    this.child,
    this.hPadding,
    this.vPadding,
    this.titleStyle,
    this.busy = false,
    super.key,
    this.withHorizontalPadding = true,
    this.withVerticalPadding = true,
    this.width,
    this.height,
    this.showLoadingWidget = true,
  });

  @override
  Widget build(BuildContext context) {
    // const double padding = 12;
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: withHorizontalPadding ? hPadding ?? 12 : 0,
          vertical: withVerticalPadding ? vPadding ?? 12 : 0),
      height: height,
      width: width,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if ((!busy || !showLoadingWidget) && withHorizontalPadding)
            SizedBox(width: hPadding),
          if (!busy || !showLoadingWidget)
            child ??
                Text(
                  title ?? '',
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: titleStyle ?? Theme.of(context).textTheme.titleMedium,
                ),
          if (busy && showLoadingWidget)
            Row(
              children: [
                LoadingAnimationWidget.prograssiveDots(
                  color: Colors.white,
                  size: 20,
                ),
                const SizedBox(width: QConstants.kFontSizeS),
                const Text(
                  "Loading",
                  maxLines: 1,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          if ((!busy || !showLoadingWidget) && withHorizontalPadding)
            SizedBox(width: hPadding),
        ],
      ),
    );
  }
}
