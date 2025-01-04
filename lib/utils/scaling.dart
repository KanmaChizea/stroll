import 'package:flutter/material.dart';
import 'package:stroll/utils/context.dart';

class ScalingOptions {
  final double factor;
  final double? min;
  final double? max;

  const ScalingOptions({this.factor = 0.2, this.min, this.max});
}

class Scaling {
  static const _baseScreenWidth = 375.0;
  static const _baseScreenHeight = 812.0;
  static final _screenWidth =
      MediaQuery.of(GlobalContext().context!).size.width;
  static final _screenHeight =
      MediaQuery.of(GlobalContext().context!).size.height;

  static bool isSmallDevice = _screenWidth < 640;
  static double _minMax(double size, double? min, double? max) {
    double back = size;
    if (min != null && size < min) back = min;
    if (max != null && size > max) back = max;
    return back;
  }

  static double scaleHorizontal(double size,
      {ScalingOptions options = const ScalingOptions()}) {
    final newSize = (size +
            ((_screenWidth / _baseScreenWidth) * size - size) * options.factor)
        .round()
        .toDouble();
    return _minMax(newSize, options.min ?? newSize, options.max ?? newSize);
  }

  static double scaleVertical(double size,
      {ScalingOptions options = const ScalingOptions()}) {
    final newSize = (size +
            ((_screenHeight / _baseScreenHeight) * size - size) *
                options.factor)
        .round()
        .toDouble();
    return _minMax(newSize, options.min ?? newSize, options.max ?? newSize);
  }

  static double scaleDownVertical(double size,
      {ScalingOptions options = const ScalingOptions()}) {
    return scaleVertical(size,
        options: ScalingOptions(
            factor: options.factor, min: options.min, max: size));
  }
}
