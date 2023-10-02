/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/kai.ttf
  String get kai => 'assets/fonts/kai.ttf';

  /// List of all assets
  List<String> get values => [kai];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/clock.png
  AssetGenImage get clock => const AssetGenImage('assets/images/clock.png');

  /// File path: assets/images/light-1.png
  AssetGenImage get light1 => const AssetGenImage('assets/images/light-1.png');

  /// File path: assets/images/light-2.png
  AssetGenImage get light2 => const AssetGenImage('assets/images/light-2.png');

  /// File path: assets/images/login_back.png
  AssetGenImage get loginBack =>
      const AssetGenImage('assets/images/login_back.png');

  /// List of all assets
  List<AssetGenImage> get values => [clock, light1, light2, loginBack];
}

class $AssetsLottiesGen {
  const $AssetsLottiesGen();

  /// File path: assets/lotties/loading.json
  String get loading => 'assets/lotties/loading.json';

  /// File path: assets/lotties/refresh_empty_page.json
  String get refreshEmptyPage => 'assets/lotties/refresh_empty_page.json';

  /// File path: assets/lotties/refresh_error.json
  String get refreshError => 'assets/lotties/refresh_error.json';

  /// File path: assets/lotties/refresh_footer.json
  String get refreshFooter => 'assets/lotties/refresh_footer.json';

  /// File path: assets/lotties/refresh_header.json
  String get refreshHeader => 'assets/lotties/refresh_header.json';

  /// List of all assets
  List<String> get values =>
      [loading, refreshEmptyPage, refreshError, refreshFooter, refreshHeader];
}

class Assets {
  Assets._();

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLottiesGen lotties = $AssetsLottiesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
