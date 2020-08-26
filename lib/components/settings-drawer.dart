import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsDrawer extends StatelessWidget {
  final bool darkThemeSet;
  final void Function(bool val) toggleDarkTheme;

  SettingsDrawer({Key key, this.darkThemeSet, this.toggleDarkTheme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          child: Text('Hello!'),
        ),
        ListTile(
          title: Text('Dark Theme'),
          trailing: CupertinoSwitch(
            value: darkThemeSet,
            onChanged: (val) => toggleDarkTheme(val),
          ),
          //onTap: () => toggleDarkTheme,
        ),
      ],
    )  
    );
  }
}