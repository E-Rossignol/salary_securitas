import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static MaterialScheme blueScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4282408848),
      surfaceTint: Color(4282408848),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4292273151),
      onPrimaryContainer: Color(4278197053),
      secondary: Color(4283785073),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4292469753),
      onSecondaryContainer: Color(4279376939),
      tertiary: Color(4285486709),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4294564094),
      onTertiaryContainer: Color(4280816431),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      background: Color(4294572543),
      onBackground: Color(4279835680),
      surface: Color(4294572543),
      onSurface: Color(4279835680),
      surfaceVariant: Color(4292928236),
      onSurfaceVariant: Color(4282664782),
      outline: Color(4285822847),
      outlineVariant: Color(4291086031),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281217078),
      inverseOnSurface: Color(4293980407),
      inversePrimary: Color(4289316863),
      primaryFixed: Color(4292273151),
      onPrimaryFixed: Color(4278197053),
      primaryFixedDim: Color(4289316863),
      onPrimaryFixedVariant: Color(4280698743),
      secondaryFixed: Color(4292469753),
      onSecondaryFixed: Color(4279376939),
      secondaryFixedDim: Color(4290627548),
      onSecondaryFixedVariant: Color(4282271576),
      tertiaryFixed: Color(4294564094),
      onTertiaryFixed: Color(4280816431),
      tertiaryFixedDim: Color(4292656353),
      onTertiaryFixedVariant: Color(4283842140),
      surfaceDim: Color(4292467168),
      surfaceBright: Color(4294572543),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294177786),
      surfaceContainer: Color(4293783028),
      surfaceContainerHigh: Color(4293388526),
      surfaceContainerHighest: Color(4293059305),
    );
  }

  ThemeData blue() {
    return theme(blueScheme().toColorScheme());
  }

  static MaterialScheme blueDarkScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4289316863),
      surfaceTint: Color(4289316863),
      onPrimary: Color(4278726751),
      primaryContainer: Color(4280698743),
      onPrimaryContainer: Color(4292273151),
      secondary: Color(4290627548),
      onSecondary: Color(4280758593),
      secondaryContainer: Color(4282271576),
      onSecondaryContainer: Color(4292469753),
      tertiary: Color(4292656353),
      onTertiary: Color(4282263621),
      tertiaryContainer: Color(4283842140),
      onTertiaryContainer: Color(4294564094),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      background: Color(4279309080),
      onBackground: Color(4293059305),
      surface: Color(4279309080),
      onSurface: Color(4293059305),
      surfaceVariant: Color(4282664782),
      onSurfaceVariant: Color(4291086031),
      outline: Color(4287533209),
      outlineVariant: Color(4282664782),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293059305),
      inverseOnSurface: Color(4281217078),
      inversePrimary: Color(4282408848),
      primaryFixed: Color(4292273151),
      onPrimaryFixed: Color(4278197053),
      primaryFixedDim: Color(4289316863),
      onPrimaryFixedVariant: Color(4280698743),
      secondaryFixed: Color(4292469753),
      onSecondaryFixed: Color(4279376939),
      secondaryFixedDim: Color(4290627548),
      onSecondaryFixedVariant: Color(4282271576),
      tertiaryFixed: Color(4294564094),
      onTertiaryFixed: Color(4280816431),
      tertiaryFixedDim: Color(4292656353),
      onTertiaryFixedVariant: Color(4283842140),
      surfaceDim: Color(4279309080),
      surfaceBright: Color(4281809214),
      surfaceContainerLowest: Color(4278980115),
      surfaceContainerLow: Color(4279835680),
      surfaceContainer: Color(4280098852),
      surfaceContainerHigh: Color(4280822319),
      surfaceContainerHighest: Color(4281546042),
    );
  }

  ThemeData blueDark() {
    return theme(blueDarkScheme().toColorScheme());
  }

  static MaterialScheme greenScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4282279991),
      surfaceTint: Color(4282279991),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4290769073),
      onPrimaryContainer: Color(4278198785),
      secondary: Color(4283654990),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4292274381),
      onSecondaryContainer: Color(4279312143),
      tertiary: Color(4281886057),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4290571247),
      onTertiaryContainer: Color(4278198306),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      background: Color(4294507505),
      onBackground: Color(4279835927),
      surface: Color(4294507505),
      onSurface: Color(4279835927),
      surfaceVariant: Color(4292863192),
      onSurfaceVariant: Color(4282534207),
      outline: Color(4285757806),
      outlineVariant: Color(4290955452),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281217579),
      inverseOnSurface: Color(4293915368),
      inversePrimary: Color(4288992151),
      primaryFixed: Color(4290769073),
      onPrimaryFixed: Color(4278198785),
      primaryFixedDim: Color(4288992151),
      onPrimaryFixedVariant: Color(4280766497),
      secondaryFixed: Color(4292274381),
      onSecondaryFixed: Color(4279312143),
      secondaryFixedDim: Color(4290497714),
      onSecondaryFixedVariant: Color(4282141495),
      tertiaryFixed: Color(4290571247),
      onTertiaryFixed: Color(4278198306),
      tertiaryFixedDim: Color(4288729043),
      onTertiaryFixedVariant: Color(4280175953),
      surfaceDim: Color(4292402130),
      surfaceBright: Color(4294507505),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294112747),
      surfaceContainer: Color(4293717989),
      surfaceContainerHigh: Color(4293323232),
      surfaceContainerHighest: Color(4292928730),
    );
  }

  ThemeData green() {
    return theme(greenScheme().toColorScheme());
  }

  static MaterialScheme greenDarkScheme() {
    return const MaterialScheme(
    brightness: Brightness.dark,
    primary: Color(4288992151),
    surfaceTint: Color(4288992151),
    onPrimary: Color(4279187469),
    primaryContainer: Color(4280766497),
    onPrimaryContainer: Color(4290769073),
    secondary: Color(4290497714),
    onSecondary: Color(4280693794),
    secondaryContainer: Color(4282141495),
    onSecondaryContainer: Color(4292274381),
    tertiary: Color(4288729043),
    onTertiary: Color(4278203962),
    tertiaryContainer: Color(4280175953),
    onTertiaryContainer: Color(4290571247),
    error: Color(4294948011),
    onError: Color(4285071365),
    errorContainer: Color(4287823882),
    onErrorContainer: Color(4294957782),
    background: Color(4279309327),
    onBackground: Color(4292928730),
    surface: Color(4279309327),
    onSurface: Color(4292928730),
    surfaceVariant: Color(4282534207),
    onSurfaceVariant: Color(4290955452),
    outline: Color(4287402887),
    outlineVariant: Color(4282534207),
    shadow: Color(4278190080),
    scrim: Color(4278190080),
    inverseSurface: Color(4292928730),
    inverseOnSurface: Color(4281217579),
    inversePrimary: Color(4282279991),
    primaryFixed: Color(4290769073),
    onPrimaryFixed: Color(4278198785),
    primaryFixedDim: Color(4288992151),
    onPrimaryFixedVariant: Color(4280766497),
    secondaryFixed: Color(4292274381),
    onSecondaryFixed: Color(4279312143),
    secondaryFixedDim: Color(4290497714),
    onSecondaryFixedVariant: Color(4282141495),
    tertiaryFixed: Color(4290571247),
    onTertiaryFixed: Color(4278198306),
    tertiaryFixedDim: Color(4288729043),
    onTertiaryFixedVariant: Color(4280175953),
    surfaceDim: Color(4279309327),
    surfaceBright: Color(4281743924),
    surfaceContainerLowest: Color(4278914826),
    surfaceContainerLow: Color(4279835927),
    surfaceContainer: Color(4280099099),
    surfaceContainerHigh: Color(4280757029),
    surfaceContainerHighest: Color(4281480752),
  );
  }

  ThemeData greenDark() {
    return theme(greenDarkScheme().toColorScheme());
  }

  static MaterialScheme orangeScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4287581235),
      surfaceTint: Color(4287581235),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4294958031),
      onPrimaryContainer: Color(4281863424),
      secondary: Color(4286011212),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4294958031),
      onSecondaryContainer: Color(4281079309),
      tertiary: Color(4285095471),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4294107815),
      onTertiaryContainer: Color(4280425216),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      background: Color(4294965494),
      onBackground: Color(4280490518),
      surface: Color(4294965494),
      onSurface: Color(4280490518),
      surfaceVariant: Color(4294303446),
      onSurfaceVariant: Color(4283646782),
      outline: Color(4286935917),
      outlineVariant: Color(4292395707),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281937451),
      inverseOnSurface: Color(4294962663),
      inversePrimary: Color(4294948251),
      primaryFixed: Color(4294958031),
      onPrimaryFixed: Color(4281863424),
      primaryFixedDim: Color(4294948251),
      onPrimaryFixedVariant: Color(4285675038),
      secondaryFixed: Color(4294958031),
      onSecondaryFixed: Color(4281079309),
      secondaryFixedDim: Color(4293377455),
      onSecondaryFixedVariant: Color(4284301365),
      tertiaryFixed: Color(4294107815),
      onTertiaryFixed: Color(4280425216),
      tertiaryFixedDim: Color(4292200078),
      onTertiaryFixedVariant: Color(4283451162),
      surfaceDim: Color(4293449425),
      surfaceBright: Color(4294965494),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294963692),
      surfaceContainer: Color(4294765284),
      surfaceContainerHigh: Color(4294436063),
      surfaceContainerHighest: Color(4294041561),
    );
  }

  ThemeData orange() {
    return theme(orangeScheme().toColorScheme());
  }

  static MaterialScheme orangeDarkScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4294948251),
      surfaceTint: Color(4294948251),
      onPrimary: Color(4283768842),
      primaryContainer: Color(4285675038),
      onPrimaryContainer: Color(4294958031),
      secondary: Color(4293377455),
      onSecondary: Color(4282657313),
      secondaryContainer: Color(4284301365),
      onSecondaryContainer: Color(4294958031),
      tertiary: Color(4292200078),
      onTertiary: Color(4281937925),
      tertiaryContainer: Color(4283451162),
      onTertiaryContainer: Color(4294107815),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      background: Color(4279898382),
      onBackground: Color(4294041561),
      surface: Color(4279898382),
      onSurface: Color(4294041561),
      surfaceVariant: Color(4283646782),
      onSurfaceVariant: Color(4292395707),
      outline: Color(4288712070),
      outlineVariant: Color(4283646782),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4294041561),
      inverseOnSurface: Color(4281937451),
      inversePrimary: Color(4287581235),
      primaryFixed: Color(4294958031),
      onPrimaryFixed: Color(4281863424),
      primaryFixedDim: Color(4294948251),
      onPrimaryFixedVariant: Color(4285675038),
      secondaryFixed: Color(4294958031),
      onSecondaryFixed: Color(4281079309),
      secondaryFixedDim: Color(4293377455),
      onSecondaryFixedVariant: Color(4284301365),
      tertiaryFixed: Color(4294107815),
      onTertiaryFixed: Color(4280425216),
      tertiaryFixedDim: Color(4292200078),
      onTertiaryFixedVariant: Color(4283451162),
      surfaceDim: Color(4279898382),
      surfaceBright: Color(4282529587),
      surfaceContainerLowest: Color(4279503881),
      surfaceContainerLow: Color(4280490518),
      surfaceContainer: Color(4280753434),
      surfaceContainerHigh: Color(4281477156),
      surfaceContainerHighest: Color(4282200623),
    );
  }

  ThemeData orangeDark() {
    return theme(orangeDarkScheme().toColorScheme());
  }

  static MaterialScheme purpleScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4286598522),
      surfaceTint: Color(4286598522),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4294957045),
      onPrimaryContainer: Color(4281600050),
      secondary: Color(4285356137),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4294433519),
      onSecondaryContainer: Color(4280751652),
      tertiary: Color(4286731077),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4294958033),
      onTertiaryContainer: Color(4281471496),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      background: Color(4294965241),
      onBackground: Color(4280293918),
      surface: Color(4294965241),
      onSurface: Color(4280293918),
      surfaceVariant: Color(4293844711),
      onSurfaceVariant: Color(4283319371),
      outline: Color(4286608508),
      outlineVariant: Color(4291936971),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281675315),
      inverseOnSurface: Color(4294634996),
      inversePrimary: Color(4294030310),
      primaryFixed: Color(4294957045),
      onPrimaryFixed: Color(4281600050),
      primaryFixedDim: Color(4294030310),
      onPrimaryFixedVariant: Color(4284823137),
      secondaryFixed: Color(4294433519),
      onSecondaryFixed: Color(4280751652),
      secondaryFixedDim: Color(4292526034),
      onSecondaryFixedVariant: Color(4283777361),
      tertiaryFixed: Color(4294958033),
      onTertiaryFixed: Color(4281471496),
      tertiaryFixedDim: Color(4294293671),
      onTertiaryFixedVariant: Color(4284890159),
      surfaceDim: Color(4293122013),
      surfaceBright: Color(4294965241),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294832375),
      surfaceContainer: Color(4294437873),
      surfaceContainerHigh: Color(4294043115),
      surfaceContainerHighest: Color(4293713893),
    );
  }

  ThemeData purple() {
    return theme(purpleScheme().toColorScheme());
  }

  static MaterialScheme purpleDarkScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4294030310),
      surfaceTint: Color(4294030310),
      onPrimary: Color(4283178825),
      primaryContainer: Color(4284823137),
      onPrimaryContainer: Color(4294957045),
      secondary: Color(4292526034),
      onSecondary: Color(4282198842),
      secondaryContainer: Color(4283777361),
      onSecondaryContainer: Color(4294433519),
      tertiary: Color(4294293671),
      onTertiary: Color(4283180571),
      tertiaryContainer: Color(4284890159),
      onTertiaryContainer: Color(4294958033),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      background: Color(4279702038),
      onBackground: Color(4293713893),
      surface: Color(4279702038),
      onSurface: Color(4293713893),
      surfaceVariant: Color(4283319371),
      onSurfaceVariant: Color(4291936971),
      outline: Color(4288318869),
      outlineVariant: Color(4283319371),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293713893),
      inverseOnSurface: Color(4281675315),
      inversePrimary: Color(4286598522),
      primaryFixed: Color(4294957045),
      onPrimaryFixed: Color(4281600050),
      primaryFixedDim: Color(4294030310),
      onPrimaryFixedVariant: Color(4284823137),
      secondaryFixed: Color(4294433519),
      onSecondaryFixed: Color(4280751652),
      secondaryFixedDim: Color(4292526034),
      onSecondaryFixedVariant: Color(4283777361),
      tertiaryFixed: Color(4294958033),
      onTertiaryFixed: Color(4281471496),
      tertiaryFixedDim: Color(4294293671),
      onTertiaryFixedVariant: Color(4284890159),
      surfaceDim: Color(4279702038),
      surfaceBright: Color(4282267452),
      surfaceContainerLowest: Color(4279373073),
      surfaceContainerLow: Color(4280293918),
      surfaceContainer: Color(4280557090),
      surfaceContainerHigh: Color(4281280557),
      surfaceContainerHighest: Color(4282004280),
    );
  }

  ThemeData purpleDark() {
    return theme(purpleDarkScheme().toColorScheme());
  }

  static MaterialScheme redScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4287646528),
      surfaceTint: Color(4287646528),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4294957780),
      onPrimaryContainer: Color(4281993477),
      secondary: Color(4286010961),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4294957780),
      onSecondaryContainer: Color(4281079058),
      tertiary: Color(4285553710),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4294696870),
      onTertiaryContainer: Color(4280621568),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      background: Color(4294965494),
      onBackground: Color(4280490264),
      surface: Color(4294965494),
      onSurface: Color(4280490264),
      surfaceVariant: Color(4294303194),
      onSurfaceVariant: Color(4283646785),
      outline: Color(4286935920),
      outlineVariant: Color(4292395710),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281937452),
      inverseOnSurface: Color(4294962666),
      inversePrimary: Color(4294948008),
      primaryFixed: Color(4294957780),
      onPrimaryFixed: Color(4281993477),
      primaryFixedDim: Color(4294948008),
      onPrimaryFixedVariant: Color(4285740074),
      secondaryFixed: Color(4294957780),
      onSecondaryFixed: Color(4281079058),
      secondaryFixedDim: Color(4293377462),
      onSecondaryFixedVariant: Color(4284301115),
      tertiaryFixed: Color(4294696870),
      onTertiaryFixed: Color(4280621568),
      tertiaryFixedDim: Color(4292789388),
      onTertiaryFixedVariant: Color(4283843609),
      surfaceDim: Color(4293449427),
      surfaceBright: Color(4294965494),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294963438),
      surfaceContainer: Color(4294765287),
      surfaceContainerHigh: Color(4294436065),
      surfaceContainerHighest: Color(4294041564),
    );
  }

  ThemeData red() {
    return theme(redScheme().toColorScheme());
  }

  static MaterialScheme redDarkScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4294948008),
      surfaceTint: Color(4294948008),
      onPrimary: Color(4283833878),
      primaryContainer: Color(4285740074),
      onPrimaryContainer: Color(4294957780),
      secondary: Color(4293377462),
      onSecondary: Color(4282657061),
      secondaryContainer: Color(4284301115),
      onSecondaryContainer: Color(4294957780),
      tertiary: Color(4292789388),
      onTertiary: Color(4282265092),
      tertiaryContainer: Color(4283843609),
      onTertiaryContainer: Color(4294696870),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      background: Color(4279898384),
      onBackground: Color(4294041564),
      surface: Color(4279898384),
      onSurface: Color(4294041564),
      surfaceVariant: Color(4283646785),
      onSurfaceVariant: Color(4292395710),
      outline: Color(4288711817),
      outlineVariant: Color(4283646785),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4294041564),
      inverseOnSurface: Color(4281937452),
      inversePrimary: Color(4287646528),
      primaryFixed: Color(4294957780),
      onPrimaryFixed: Color(4281993477),
      primaryFixedDim: Color(4294948008),
      onPrimaryFixedVariant: Color(4285740074),
      secondaryFixed: Color(4294957780),
      onSecondaryFixed: Color(4281079058),
      secondaryFixedDim: Color(4293377462),
      onSecondaryFixedVariant: Color(4284301115),
      tertiaryFixed: Color(4294696870),
      onTertiaryFixed: Color(4280621568),
      tertiaryFixedDim: Color(4292789388),
      onTertiaryFixedVariant: Color(4283843609),
      surfaceDim: Color(4279898384),
      surfaceBright: Color(4282529589),
      surfaceContainerLowest: Color(4279503883),
      surfaceContainerLow: Color(4280490264),
      surfaceContainer: Color(4280753436),
      surfaceContainerHigh: Color(4281477158),
      surfaceContainerHighest: Color(4282200624),
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
