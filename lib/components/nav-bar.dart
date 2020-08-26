import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'settings-drawer.dart';

class NavBar extends StatefulWidget {
  final bool darkThemeSet;
  final void Function(bool val) toggleDarkTheme;
  final Widget routeBody;

  NavBar({this.darkThemeSet, this.toggleDarkTheme, this.routeBody});

  @override
  _NavBar createState() => _NavBar();
}

class _NavBar extends State<NavBar> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('My Little Journal'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => _scaffoldKey.currentState.openEndDrawer(),
          ),
        ],
      ),
      endDrawer: SettingsDrawer(
          darkThemeSet: widget.darkThemeSet,
          toggleDarkTheme: widget.toggleDarkTheme),
      body: widget.routeBody,
    );
  }
}
