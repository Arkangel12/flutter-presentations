import 'package:flutter/material.dart';
import 'package:flutter_presentations/features/convincing_for_flutter/shared/groupon_theme.dart';

ThemeData blueLight() {
  return ThemeData.light().copyWith(
    textTheme: TextTheme(
      display1: GTheme.big.copyWith(color: GTheme.flutter3, fontSize: 140),
      headline: GTheme.big.copyWith(color: GTheme.flutter2, fontSize: 90),
      title: GTheme.big.copyWith(color: GTheme.flutter2, fontSize: 80),
      body1: GTheme.big.copyWith(color: GTheme.flutter2),
      caption: GTheme.smaller.copyWith(color: GTheme.flutter1),
    ),
  );
}

class PresentationTheme extends StatelessWidget {
  const PresentationTheme({
    Key key,
    @required this.data,
    @required this.child,
  })  : assert(data != null),
        super(key: key);

  final PresentationThemeData data;
  final Widget child;

  static PresentationThemeData of(BuildContext context) {
    return PresentationThemeData.fromThemeData(Theme.of(context));
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: data.themeData(ThemeData.light()),
      child: child,
    );
  }

//
//@override
//void debugFillProperties(PresentationTheme properties) {
//  super.debugFillProperties(properties);
//  properties.add(FlagProperty(
//    'mode',
//    value: enabled,
//    ifTrue: 'enabled',
//    ifFalse: 'disabled',
//    showName: true,
//  ));
//}
}

class PresentationTextTheme {
  const PresentationTextTheme({
    this.display,
    this.headline,
    this.title,
    this.body,
    this.caption,
  });

  factory PresentationTextTheme.fromTextTheme(TextTheme textTheme) {
    return PresentationTextTheme(
      display: textTheme.display1,
      headline: textTheme.headline,
      title: textTheme.title,
      body: textTheme.body1,
      caption: textTheme.caption,
    );
  }

  final TextStyle display;
  final TextStyle headline;
  final TextStyle title;
  final TextStyle body;
  final TextStyle caption;

  TextTheme textTheme(TextTheme textTheme) {
    return textTheme.copyWith(
      display1: display,
      headline: headline,
      title: title,
      body1: body,
      caption: caption,
    );
  }
}

class PresentationThemeData {
  PresentationThemeData({
    this.textTheme,
    this.primary,
    this.secondary,
    this.tertiary,
  });

  factory PresentationThemeData.fromThemeData(ThemeData themeData) {
    return PresentationThemeData(
      textTheme: PresentationTextTheme.fromTextTheme(themeData.textTheme),
      primary: themeData.primaryColor,
      secondary: themeData.accentColor,
      tertiary: themeData.backgroundColor,
    );
  }

  ThemeData themeData(ThemeData themData) {
    return themData.copyWith(
      primaryColor: primary,
      accentColor: secondary,
      backgroundColor: tertiary,
      textTheme: textTheme.textTheme(themData.textTheme),
    );
  }

  final PresentationTextTheme textTheme;
  final Color primary;
  final Color secondary;
  final Color tertiary;
}
