import 'package:flutter/material.dart';

import '../components/entry-details.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map args = ModalRoute.of(context).settings.arguments as Map;
    return EntryDetails(entry: args['entry']);
  }
}
