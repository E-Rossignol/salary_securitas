import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static MaterialScheme blueScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff4f5b92),
      surfaceTint: Color(0xff4f5b92),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffdde1ff),
      onPrimaryContainer: Color(0xff06164b),
      secondary: Color(0xff5a5d72),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffdee1f9),
      onSecondaryContainer: Color(0xff171b2c),
      tertiary: Color(0xff75546e),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffffd7f4),
      onTertiaryContainer: Color(0xff2c1229),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      background: Color(0xfffbf8ff),
      onBackground: Color(0xff1a1b21),
      surface: Color(0xfffbf8ff),
      onSurface: Color(0xff1a1b21),
      surfaceVariant: Color(0xffe2e1ec),
      onSurfaceVariant: Color(0xff45464f),
      outline: Color(0xff767680),
      outlineVariant: Color(0xffc6c5d0),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2f3036),
      inverseOnSurface: Color(0xfff2f0f7),
      inversePrimary: Color(0xffb8c4ff),
      primaryFixed: Color(0xffdde1ff),
      onPrimaryFixed: Color(0xff06164b),
      primaryFixedDim: Color(0xffb8c4ff),
      onPrimaryFixedVariant: Color(0xff374379),
      secondaryFixed: Color(0xffdee1f9),
      onSecondaryFixed: Color(0xff171b2c),
      secondaryFixedDim: Color(0xffc2c5dd),
      onSecondaryFixedVariant: Color(0xff424659),
      tertiaryFixed: Color(0xffffd7f4),
      onTertiaryFixed: Color(0xff2c1229),
      tertiaryFixedDim: Color(0xffe4bad9),
      onTertiaryFixedVariant: Color(0xff5c3d56),
      surfaceDim: Color(0xffdbd9e0),
      surfaceBright: Color(0xfffbf8ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff4f2fa),
      surfaceContainer: Color(0xffefedf4),
      surfaceContainerHigh: Color(0xffe9e7ef),
      surfaceContainerHighest: Color(0xffe3e1e9),
    );
  }

  ThemeData blue() {
    return theme(blueScheme().toColorScheme());
  }

  static MaterialScheme blueDarkScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xffb8c4ff),
      surfaceTint: Color(0xffb8c4ff),
      onPrimary: Color(0xff1f2d61),
      primaryContainer: Color(0xff374379),
      onPrimaryContainer: Color(0xffdde1ff),
      secondary: Color(0xffc2c5dd),
      onSecondary: Color(0xff2c2f42),
      secondaryContainer: Color(0xff424659),
      onSecondaryContainer: Color(0xffdee1f9),
      tertiary: Color(0xffe4bad9),
      onTertiary: Color(0xff43273f),
      tertiaryContainer: Color(0xff5c3d56),
      onTertiaryContainer: Color(0xffffd7f4),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      background: Color(0xff121318),
      onBackground: Color(0xffe3e1e9),
      surface: Color(0xff121318),
      onSurface: Color(0xffe3e1e9),
      surfaceVariant: Color(0xff45464f),
      onSurfaceVariant: Color(0xffc6c5d0),
      outline: Color(0xff90909a),
      outlineVariant: Color(0xff45464f),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe3e1e9),
      inverseOnSurface: Color(0xff2f3036),
      inversePrimary: Color(0xff4f5b92),
      primaryFixed: Color(0xffdde1ff),
      onPrimaryFixed: Color(0xff06164b),
      primaryFixedDim: Color(0xffb8c4ff),
      onPrimaryFixedVariant: Color(0xff374379),
      secondaryFixed: Color(0xffdee1f9),
      onSecondaryFixed: Color(0xff171b2c),
      secondaryFixedDim: Color(0xffc2c5dd),
      onSecondaryFixedVariant: Color(0xff424659),
      tertiaryFixed: Color(0xffffd7f4),
      onTertiaryFixed: Color(0xff2c1229),
      tertiaryFixedDim: Color(0xffe4bad9),
      onTertiaryFixedVariant: Color(0xff5c3d56),
      surfaceDim: Color(0xff121318),
      surfaceBright: Color(0xff38393f),
      surfaceContainerLowest: Color(0xff0d0e13),
      surfaceContainerLow: Color(0xff1a1b21),
      surfaceContainer: Color(0xff1f1f25),
      surfaceContainerHigh: Color(0xff292a2f),
      surfaceContainerHighest: Color(0xff34343a),
    );
  }

  ThemeData blueDark() {
    return theme(blueDarkScheme().toColorScheme());
  }

  static MaterialScheme greenScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff336940),
      surfaceTint: Color(0xff336940),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffb5f1bd),
      onPrimaryContainer: Color(0xff00210b),
      secondary: Color(0xff506352),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffd3e8d2),
      onSecondaryContainer: Color(0xff0e1f12),
      tertiary: Color(0xff39656e),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffbdeaf4),
      onTertiaryContainer: Color(0xff001f25),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      background: Color(0xfff6fbf2),
      onBackground: Color(0xff181d18),
      surface: Color(0xfff6fbf2),
      onSurface: Color(0xff181d18),
      surfaceVariant: Color(0xffdde5da),
      onSurfaceVariant: Color(0xff414941),
      outline: Color(0xff717970),
      outlineVariant: Color(0xffc1c9be),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2d322c),
      inverseOnSurface: Color(0xffeef2ea),
      inversePrimary: Color(0xff99d4a2),
      primaryFixed: Color(0xffb5f1bd),
      onPrimaryFixed: Color(0xff00210b),
      primaryFixedDim: Color(0xff99d4a2),
      onPrimaryFixedVariant: Color(0xff19512b),
      secondaryFixed: Color(0xffd3e8d2),
      onSecondaryFixed: Color(0xff0e1f12),
      secondaryFixedDim: Color(0xffb7ccb7),
      onSecondaryFixedVariant: Color(0xff394b3b),
      tertiaryFixed: Color(0xffbdeaf4),
      onTertiaryFixed: Color(0xff001f25),
      tertiaryFixedDim: Color(0xffa2ced8),
      onTertiaryFixedVariant: Color(0xff204d55),
      surfaceDim: Color(0xffd7dbd3),
      surfaceBright: Color(0xfff6fbf2),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff1f5ed),
      surfaceContainer: Color(0xffebefe7),
      surfaceContainerHigh: Color(0xffe5eae1),
      surfaceContainerHighest: Color(0xffdfe4dc),
    );
  }

  ThemeData green() {
    return theme(greenScheme().toColorScheme());
  }

  static MaterialScheme greenDarkScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xff99d4a2),
      surfaceTint: Color(0xff99d4a2),
      onPrimary: Color(0xff003918),
      primaryContainer: Color(0xff19512b),
      onPrimaryContainer: Color(0xffb5f1bd),
      secondary: Color(0xffb7ccb7),
      onSecondary: Color(0xff233426),
      secondaryContainer: Color(0xff394b3b),
      onSecondaryContainer: Color(0xffd3e8d2),
      tertiary: Color(0xffa2ced8),
      onTertiary: Color(0xff00363e),
      tertiaryContainer: Color(0xff204d55),
      onTertiaryContainer: Color(0xffbdeaf4),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      background: Color(0xff101510),
      onBackground: Color(0xffdfe4dc),
      surface: Color(0xff101510),
      onSurface: Color(0xffdfe4dc),
      surfaceVariant: Color(0xff414941),
      onSurfaceVariant: Color(0xffc1c9be),
      outline: Color(0xff8b9389),
      outlineVariant: Color(0xff414941),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdfe4dc),
      inverseOnSurface: Color(0xff2d322c),
      inversePrimary: Color(0xff336940),
      primaryFixed: Color(0xffb5f1bd),
      onPrimaryFixed: Color(0xff00210b),
      primaryFixedDim: Color(0xff99d4a2),
      onPrimaryFixedVariant: Color(0xff19512b),
      secondaryFixed: Color(0xffd3e8d2),
      onSecondaryFixed: Color(0xff0e1f12),
      secondaryFixedDim: Color(0xffb7ccb7),
      onSecondaryFixedVariant: Color(0xff394b3b),
      tertiaryFixed: Color(0xffbdeaf4),
      onTertiaryFixed: Color(0xff001f25),
      tertiaryFixedDim: Color(0xffa2ced8),
      onTertiaryFixedVariant: Color(0xff204d55),
      surfaceDim: Color(0xff101510),
      surfaceBright: Color(0xff353a35),
      surfaceContainerLowest: Color(0xff0b0f0b),
      surfaceContainerLow: Color(0xff181d18),
      surfaceContainer: Color(0xff1c211c),
      surfaceContainerHigh: Color(0xff262b26),
      surfaceContainerHighest: Color(0xff313631),
    );
  }

  ThemeData greenDark() {
    return theme(greenDarkScheme().toColorScheme());
  }

  static MaterialScheme orangeScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff815512),
      surfaceTint: Color(0xff815512),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffffddb7),
      onPrimaryContainer: Color(0xff2a1700),
      secondary: Color(0xff705b41),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xfffcdebc),
      onSecondaryContainer: Color(0xff281805),
      tertiary: Color(0xff53643e),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffd6e9b9),
      onTertiaryContainer: Color(0xff121f03),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      background: Color(0xfffff8f4),
      onBackground: Color(0xff211a13),
      surface: Color(0xfffff8f4),
      onSurface: Color(0xff211a13),
      surfaceVariant: Color(0xfff0e0d0),
      onSurfaceVariant: Color(0xff504539),
      outline: Color(0xff827568),
      outlineVariant: Color(0xffd4c4b5),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff362f27),
      inverseOnSurface: Color(0xfffceee2),
      inversePrimary: Color(0xfff7bb70),
      primaryFixed: Color(0xffffddb7),
      onPrimaryFixed: Color(0xff2a1700),
      primaryFixedDim: Color(0xfff7bb70),
      onPrimaryFixedVariant: Color(0xff653e00),
      secondaryFixed: Color(0xfffcdebc),
      onSecondaryFixed: Color(0xff281805),
      secondaryFixedDim: Color(0xffdfc2a2),
      onSecondaryFixedVariant: Color(0xff57432b),
      tertiaryFixed: Color(0xffd6e9b9),
      onTertiaryFixed: Color(0xff121f03),
      tertiaryFixedDim: Color(0xffbacd9f),
      onTertiaryFixedVariant: Color(0xff3c4c28),
      surfaceDim: Color(0xffe5d8cc),
      surfaceBright: Color(0xfffff8f4),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff1e5),
      surfaceContainer: Color(0xfff9ece0),
      surfaceContainerHigh: Color(0xfff3e6da),
      surfaceContainerHighest: Color(0xffeee0d4),
    );
  }

  ThemeData orange() {
    return theme(orangeScheme().toColorScheme());
  }

  static MaterialScheme orangeDarkScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xfff7bb70),
      surfaceTint: Color(0xfff7bb70),
      onPrimary: Color(0xff462a00),
      primaryContainer: Color(0xff653e00),
      onPrimaryContainer: Color(0xffffddb7),
      secondary: Color(0xffdfc2a2),
      onSecondary: Color(0xff3f2d17),
      secondaryContainer: Color(0xff57432b),
      onSecondaryContainer: Color(0xfffcdebc),
      tertiary: Color(0xffbacd9f),
      onTertiary: Color(0xff263514),
      tertiaryContainer: Color(0xff3c4c28),
      onTertiaryContainer: Color(0xffd6e9b9),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      background: Color(0xff18120c),
      onBackground: Color(0xffeee0d4),
      surface: Color(0xff18120c),
      onSurface: Color(0xffeee0d4),
      surfaceVariant: Color(0xff504539),
      onSurfaceVariant: Color(0xffd4c4b5),
      outline: Color(0xff9c8e80),
      outlineVariant: Color(0xff504539),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffeee0d4),
      inverseOnSurface: Color(0xff362f27),
      inversePrimary: Color(0xff815512),
      primaryFixed: Color(0xffffddb7),
      onPrimaryFixed: Color(0xff2a1700),
      primaryFixedDim: Color(0xfff7bb70),
      onPrimaryFixedVariant: Color(0xff653e00),
      secondaryFixed: Color(0xfffcdebc),
      onSecondaryFixed: Color(0xff281805),
      secondaryFixedDim: Color(0xffdfc2a2),
      onSecondaryFixedVariant: Color(0xff57432b),
      tertiaryFixed: Color(0xffd6e9b9),
      onTertiaryFixed: Color(0xff121f03),
      tertiaryFixedDim: Color(0xffbacd9f),
      onTertiaryFixedVariant: Color(0xff3c4c28),
      surfaceDim: Color(0xff18120c),
      surfaceBright: Color(0xff403830),
      surfaceContainerLowest: Color(0xff130d07),
      surfaceContainerLow: Color(0xff211a13),
      surfaceContainer: Color(0xff251e17),
      surfaceContainerHigh: Color(0xff302921),
      surfaceContainerHighest: Color(0xff3b332b),
    );
  }

  ThemeData orangeDark() {
    return theme(orangeDarkScheme().toColorScheme());
  }

  static MaterialScheme purpleScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff775084),
      surfaceTint: Color(0xff775084),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xfff9d8ff),
      onPrimaryContainer: Color(0xff2e0a3c),
      secondary: Color(0xff69596d),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xfff1dcf3),
      onSecondaryContainer: Color(0xff241728),
      tertiary: Color(0xff81524f),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffffdad7),
      onTertiaryContainer: Color(0xff331110),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      background: Color(0xfffff7fb),
      onBackground: Color(0xff1f1a1f),
      surface: Color(0xfffff7fb),
      onSurface: Color(0xff1f1a1f),
      surfaceVariant: Color(0xffebdfe9),
      onSurfaceVariant: Color(0xff4c444d),
      outline: Color(0xff7d747d),
      outlineVariant: Color(0xffcec3cd),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff342f34),
      inverseOnSurface: Color(0xfff8eef5),
      inversePrimary: Color(0xffe5b6f2),
      primaryFixed: Color(0xfff9d8ff),
      onPrimaryFixed: Color(0xff2e0a3c),
      primaryFixedDim: Color(0xffe5b6f2),
      onPrimaryFixedVariant: Color(0xff5d386b),
      secondaryFixed: Color(0xfff1dcf3),
      onSecondaryFixed: Color(0xff241728),
      secondaryFixedDim: Color(0xffd5c0d7),
      onSecondaryFixedVariant: Color(0xff514254),
      tertiaryFixed: Color(0xffffdad7),
      onTertiaryFixed: Color(0xff331110),
      tertiaryFixedDim: Color(0xfff5b7b4),
      onTertiaryFixedVariant: Color(0xff663b39),
      surfaceDim: Color(0xffe1d7df),
      surfaceBright: Color(0xfffff7fb),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffbf1f8),
      surfaceContainer: Color(0xfff5ebf2),
      surfaceContainerHigh: Color(0xffefe5ed),
      surfaceContainerHighest: Color(0xffeae0e7),
    );
  }

  ThemeData purple() {
    return theme(purpleScheme().toColorScheme());
  }

  static MaterialScheme purpleDarkScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xffe5b6f2),
      surfaceTint: Color(0xffe5b6f2),
      onPrimary: Color(0xff452152),
      primaryContainer: Color(0xff5d386b),
      onPrimaryContainer: Color(0xfff9d8ff),
      secondary: Color(0xffd5c0d7),
      onSecondary: Color(0xff392c3d),
      secondaryContainer: Color(0xff514254),
      onSecondaryContainer: Color(0xfff1dcf3),
      tertiary: Color(0xfff5b7b4),
      onTertiary: Color(0xff4c2524),
      tertiaryContainer: Color(0xff663b39),
      onTertiaryContainer: Color(0xffffdad7),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      background: Color(0xff161217),
      onBackground: Color(0xffeae0e7),
      surface: Color(0xff161217),
      onSurface: Color(0xffeae0e7),
      surfaceVariant: Color(0xff4c444d),
      onSurfaceVariant: Color(0xffcec3cd),
      outline: Color(0xff988e97),
      outlineVariant: Color(0xff4c444d),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffeae0e7),
      inverseOnSurface: Color(0xff342f34),
      inversePrimary: Color(0xff775084),
      primaryFixed: Color(0xfff9d8ff),
      onPrimaryFixed: Color(0xff2e0a3c),
      primaryFixedDim: Color(0xffe5b6f2),
      onPrimaryFixedVariant: Color(0xff5d386b),
      secondaryFixed: Color(0xfff1dcf3),
      onSecondaryFixed: Color(0xff241728),
      secondaryFixedDim: Color(0xffd5c0d7),
      onSecondaryFixedVariant: Color(0xff514254),
      tertiaryFixed: Color(0xffffdad7),
      onTertiaryFixed: Color(0xff331110),
      tertiaryFixedDim: Color(0xfff5b7b4),
      onTertiaryFixedVariant: Color(0xff663b39),
      surfaceDim: Color(0xff161217),
      surfaceBright: Color(0xff3d373d),
      surfaceContainerLowest: Color(0xff110d12),
      surfaceContainerLow: Color(0xff1f1a1f),
      surfaceContainer: Color(0xff231e23),
      surfaceContainerHigh: Color(0xff2d282e),
      surfaceContainerHighest: Color(0xff383339),
    );
  }

  ThemeData purpleDark() {
    return theme(purpleDarkScheme().toColorScheme());
  }

  static MaterialScheme redScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xffc41706),
      surfaceTint: Color(0xff904b3f),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffffdad4),
      // ignore: use_full_hex_values_for_flutter_colors
      onPrimaryContainer: Color(4281993476),
      secondary: Color(0xff775651),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffffdad4),
      onSecondaryContainer: Color(0xff2c1511),
      tertiary: Color(0xff6f5c2e),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xfffbe0a6),
      onTertiaryContainer: Color(0xff251a00),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      background: Color(0xfffff8f6),
      onBackground: Color(0xff231918),
      surface: Color(0xfffff8f6),
      onSurface: Color(0xff231918),
      surfaceVariant: Color(0xfff5ddd9),
      onSurfaceVariant: Color(0xff534341),
      outline: Color(0xff857370),
      outlineVariant: Color(0xffd8c2be),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff392e2c),
      inverseOnSurface: Color(0xffffedea),
      inversePrimary: Color(0xffffb4a7),
      primaryFixed: Color(0xffffdad4),
      onPrimaryFixed: Color(0xff3a0904),
      primaryFixedDim: Color(0xffffb4a7),
      onPrimaryFixedVariant: Color(0xff73342a),
      secondaryFixed: Color(0xffffdad4),
      onSecondaryFixed: Color(0xff2c1511),
      secondaryFixedDim: Color(0xffe7bdb6),
      onSecondaryFixedVariant: Color(0xff5d3f3a),
      tertiaryFixed: Color(0xfffbe0a6),
      onTertiaryFixed: Color(0xff251a00),
      tertiaryFixedDim: Color(0xffddc48c),
      onTertiaryFixedVariant: Color(0xff564419),
      surfaceDim: Color(0xffe8d6d3),
      surfaceBright: Color(0xfffff8f6),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff0ee),
      surfaceContainer: Color(0xfffceae7),
      surfaceContainerHigh: Color(0xfff7e4e1),
      surfaceContainerHighest: Color(0xfff1dfdb),
    );
  }

  ThemeData red() {
    return theme(redScheme().toColorScheme());
  }

  static MaterialScheme redDarkScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffb4a7),
      surfaceTint: Color(0xffffb4a7),
      onPrimary: Color(0xff561e16),
      primaryContainer: Color(0xff73342a),
      onPrimaryContainer: Color(0xffffdad4),
      secondary: Color(0xffe7bdb6),
      onSecondary: Color(0xff442925),
      secondaryContainer: Color(0xff5d3f3a),
      onSecondaryContainer: Color(0xffffdad4),
      tertiary: Color(0xffddc48c),
      onTertiary: Color(0xff3e2e04),
      tertiaryContainer: Color(0xff564419),
      onTertiaryContainer: Color(0xfffbe0a6),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      background: Color(0xff1a1110),
      onBackground: Color(0xfff1dfdb),
      surface: Color(0xff1a1110),
      onSurface: Color(0xfff1dfdb),
      surfaceVariant: Color(0xff534341),
      onSurfaceVariant: Color(0xffd8c2be),
      outline: Color(0xffa08c89),
      outlineVariant: Color(0xff534341),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff1dfdb),
      inverseOnSurface: Color(0xff392e2c),
      inversePrimary: Color(0xff904b3f),
      primaryFixed: Color(0xffffdad4),
      onPrimaryFixed: Color(0xff3a0904),
      primaryFixedDim: Color(0xffffb4a7),
      onPrimaryFixedVariant: Color(0xff73342a),
      secondaryFixed: Color(0xffffdad4),
      onSecondaryFixed: Color(0xff2c1511),
      secondaryFixedDim: Color(0xffe7bdb6),
      onSecondaryFixedVariant: Color(0xff5d3f3a),
      tertiaryFixed: Color(0xfffbe0a6),
      onTertiaryFixed: Color(0xff251a00),
      tertiaryFixedDim: Color(0xffddc48c),
      onTertiaryFixedVariant: Color(0xff564419),
      surfaceDim: Color(0xff1a1110),
      surfaceBright: Color(0xff423735),
      surfaceContainerLowest: Color(0xff140c0b),
      surfaceContainerLow: Color(0xff231918),
      surfaceContainer: Color(0xff271d1c),
      surfaceContainerHigh: Color(0xff322826),
      surfaceContainerHighest: Color(0xff3d3230),
    );
  }

  ThemeData redDark() {
    return theme(redDarkScheme().toColorScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          fontFamily: 'Montserrat',
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.background,
        canvasColor: colorScheme.surface,
      );
}

class MaterialScheme {
  const MaterialScheme({
    required this.brightness,
    required this.primary,
    required this.surfaceTint,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.secondary,
    required this.onSecondary,
    required this.secondaryContainer,
    required this.onSecondaryContainer,
    required this.tertiary,
    required this.onTertiary,
    required this.tertiaryContainer,
    required this.onTertiaryContainer,
    required this.error,
    required this.onError,
    required this.errorContainer,
    required this.onErrorContainer,
    required this.background,
    required this.onBackground,
    required this.surface,
    required this.onSurface,
    required this.surfaceVariant,
    required this.onSurfaceVariant,
    required this.outline,
    required this.outlineVariant,
    required this.shadow,
    required this.scrim,
    required this.inverseSurface,
    required this.inverseOnSurface,
    required this.inversePrimary,
    required this.primaryFixed,
    required this.onPrimaryFixed,
    required this.primaryFixedDim,
    required this.onPrimaryFixedVariant,
    required this.secondaryFixed,
    required this.onSecondaryFixed,
    required this.secondaryFixedDim,
    required this.onSecondaryFixedVariant,
    required this.tertiaryFixed,
    required this.onTertiaryFixed,
    required this.tertiaryFixedDim,
    required this.onTertiaryFixedVariant,
    required this.surfaceDim,
    required this.surfaceBright,
    required this.surfaceContainerLowest,
    required this.surfaceContainerLow,
    required this.surfaceContainer,
    required this.surfaceContainerHigh,
    required this.surfaceContainerHighest,
  });

  final Brightness brightness;
  final Color primary;
  final Color surfaceTint;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color surfaceVariant;
  final Color onSurfaceVariant;
  final Color outline;
  final Color outlineVariant;
  final Color shadow;
  final Color scrim;
  final Color inverseSurface;
  final Color inverseOnSurface;
  final Color inversePrimary;
  final Color primaryFixed;
  final Color onPrimaryFixed;
  final Color primaryFixedDim;
  final Color onPrimaryFixedVariant;
  final Color secondaryFixed;
  final Color onSecondaryFixed;
  final Color secondaryFixedDim;
  final Color onSecondaryFixedVariant;
  final Color tertiaryFixed;
  final Color onTertiaryFixed;
  final Color tertiaryFixedDim;
  final Color onTertiaryFixedVariant;
  final Color surfaceDim;
  final Color surfaceBright;
  final Color surfaceContainerLowest;
  final Color surfaceContainerLow;
  final Color surfaceContainer;
  final Color surfaceContainerHigh;
  final Color surfaceContainerHighest;
}

extension MaterialSchemeUtils on MaterialScheme {
  ColorScheme toColorScheme() {
    return ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: onPrimary,
      primaryContainer: primaryContainer,
      onPrimaryContainer: onPrimaryContainer,
      secondary: secondary,
      onSecondary: onSecondary,
      secondaryContainer: secondaryContainer,
      onSecondaryContainer: onSecondaryContainer,
      tertiary: tertiary,
      onTertiary: onTertiary,
      tertiaryContainer: tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer,
      error: error,
      onError: onError,
      errorContainer: errorContainer,
      onErrorContainer: onErrorContainer,
      background: background,
      onBackground: onBackground,
      surface: surface,
      onSurface: onSurface,
      surfaceVariant: surfaceVariant,
      onSurfaceVariant: onSurfaceVariant,
      outline: outline,
      outlineVariant: outlineVariant,
      shadow: shadow,
      scrim: scrim,
      inverseSurface: inverseSurface,
      onInverseSurface: inverseOnSurface,
      inversePrimary: inversePrimary,
    );
  }
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
