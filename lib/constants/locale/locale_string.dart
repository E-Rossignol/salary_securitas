import 'package:get/get.dart';
import 'en.dart';
import 'es.dart';
import 'fr.dart';
import 'it.dart';
import 'de.dart';

/// The `LocaleString` class represents a collection of translations for various locales.
///
/// It extends `Translations`, a class provided by the GetX package, which is used to handle localization in Flutter applications.
///
/// The class overrides the `keys` getter to provide a `Map<String, Map<String, String>>` where each key is a locale code (like 'en', 'fr', 'it', 'de') and the corresponding value is a map of translations for that locale.
class LocaleString extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': enLocale,
        'fr': frLocale,
        'it': itLocale,
        'de': deLocale,
        'es': esLocale,
      };
}
