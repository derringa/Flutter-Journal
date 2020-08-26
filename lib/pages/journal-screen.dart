import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/text-entry.dart';
import '../components/action-button.dart';
import '../components/entry-details.dart';
import '../components/entry-list.dart';
import '../models/database.dart';
import '../models/journal-entry.dart';

class JournalScreen extends StatefulWidget {
  @override
  _JournalScreenState createState() => _JournalScreenState();
}

class _JournalScreenState extends State<JournalScreen> {
  final JournalDatabase db = JournalDatabase(dbName: 'journal.db');
  List<JournalEntry> journal = [];
  int activeEntry = -1;

  void initState() {
    super.initState();
    loadEntries();
  }

  void loadEntries() async {
    await db.openDB();
    final journalEntries = await db.orderedSelectDB();
    setState(() {
      journal = journalEntries;
    });
  }

  void removeEntry(id) async {
    db.deleteDB(id);
    final journalEntries = await db.orderedSelectDB();
    setState(() {
      journal = journalEntries;
      if (id == activeEntry) {
        activeEntry = -1;
      }
    });
  }

  void setActiveEntry(id) async {
    print('working on it!');
    setState(() => activeEntry = id);
  }

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width >= 600) {
      return Row(
        children: <Widget>[
          Expanded(
            child: EntryList(
              journal: journal,
              removeMethod: removeEntry,
              stateMethod: setActiveEntry,
            ),
          ),
          Expanded(
            child: Stack(children: [
              Container(
                alignment: Alignment.topLeft,
                child: activeEntry == -1 ? Center(child: Icon(Icons.description)) : 
                  EntryDetails(
                    entry: journal.firstWhere((e) => e.id == activeEntry),
                  ),
              ),
              ActionButton(stateMethod: loadEntries),
            ]),
          ),
        ],
      );
    }
    return SizedBox.expand(
        child: Stack(children: <Widget>[
      EntryList(journal: journal, removeMethod: removeEntry),
      ActionButton(stateMethod: loadEntries)
    ]));
  }
}
