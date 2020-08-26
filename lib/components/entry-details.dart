import 'package:flutter/material.dart';
import '../models/journal-entry.dart';

class EntryDetails extends StatelessWidget {
  final JournalEntry entry;

  EntryDetails({Key key, this.entry}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              entry.getStyledDate(),
              style: TextStyle(fontSize: 16.0),
            ),
            Row(children: <Widget>[
              Text(
                entry.title,
                style: TextStyle(fontSize: 24.0),
              ),
              Spacer(),
              Icon(Icons.star),
              Text(
                entry.rating.toString(),
                style: TextStyle(fontSize: 24.0),
              ),
            ]),
            Divider(
              color: Colors.deepOrange,
              thickness: 3,
              height: 40,
              indent: 0,
              endIndent: 0,
            ),
            Text(
              entry.body,
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
