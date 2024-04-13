import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get flutter_bloc_base => 'Flutter Bloc Base';

  @override
  String get home => 'Home';

  @override
  String get profile => 'Profile';

  @override
  String get bill => 'Bill';

  @override
  String get hi => 'Hi';

  @override
  String get pageNotFoundInvalidLink => 'Page Not Found: Invalid Link!';

  @override
  String get goBack => 'Go Back';

  @override
  String welcomeUser(Object name) {
    return 'Welcome $name';
  }

  @override
  String get settings => 'Settings';

  @override
  String get search => 'Search';
}
