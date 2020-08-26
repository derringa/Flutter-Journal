import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/detail-screen.dart';
import 'screens/journal-screen.dart';
import 'screens/entry-screen.dart';
import 'components/nav-bar.dart';
import 'screens/splash-screen.dart';

class App extends StatefulWidget {
  final SharedPreferences prefs;

  App({Key key, @required this.prefs}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  static const THEME_KEY = 'darkTheme';
  static const VISIT_KEY = 'firstVisit';

  bool get darkThemeSet => widget.prefs.getBool(THEME_KEY) ?? false;

  bool firstVisit() {
    if (widget.prefs.getBool(VISIT_KEY) == null) {
      widget.prefs.setBool(VISIT_KEY, false);
      return true;
    }
    //widget.prefs.clear();
    return false;
  }

  void toggleDarkTheme(bool val) {
    widget.prefs.setBool(THEME_KEY, val);
    setState(() => {});
  }

  Widget buildRoute(body) => NavBar(
      darkThemeSet: darkThemeSet,
      toggleDarkTheme: toggleDarkTheme,
      routeBody: body);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Journal',
        theme: ThemeData(
          brightness: (darkThemeSet ? Brightness.dark : Brightness.light),
          primarySwatch: Colors.deepOrange,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          '/': (context) =>
              firstVisit() ? SplashScreen() : buildRoute(JournalScreen()),
          'entry': (contect) => buildRoute(EntryScreen()),
          'detail': (contect) => buildRoute(DetailScreen()),
        });
  }
}
