// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class TZBLocalizations {
  TZBLocalizations();

  static TZBLocalizations? _current;

  static TZBLocalizations get current {
    assert(
      _current != null,
      'No instance of TZBLocalizations was loaded. Try to initialize the TZBLocalizations delegate before accessing TZBLocalizations.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<TZBLocalizations> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = TZBLocalizations();
      TZBLocalizations._current = instance;

      return instance;
    });
  }

  static TZBLocalizations of(BuildContext context) {
    final instance = TZBLocalizations.maybeOf(context);
    assert(
      instance != null,
      'No instance of TZBLocalizations present in the widget tree. Did you add TZBLocalizations.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static TZBLocalizations? maybeOf(BuildContext context) {
    return Localizations.of<TZBLocalizations>(context, TZBLocalizations);
  }

  /// `Flux Store`
  String get appName {
    return Intl.message('Flux Store', name: 'appName', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<TZBLocalizations> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[Locale.fromSubtags(languageCode: 'en')];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<TZBLocalizations> load(Locale locale) => TZBLocalizations.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
