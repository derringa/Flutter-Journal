import 'package:flutter/material.dart';

import '../models/journal-entry.dart';

class EntryList extends StatelessWidget {
  final List<JournalEntry> journal;
  final Function(int) removeMethod;
  final Function(int) stateMethod;

  EntryList({Key key, this.journal, this.removeMethod, this.stateMethod}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: journal.length,
      itemBuilder: (context, i) {
        return (ListTile(
          leading: Icon(Icons.description),
          title: Text(journal[i].getStyledDate()),
          subtitle: Text(journal[i].title),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () => removeMethod(journal[i].id),
          ),
          onTap: MediaQuery.of(context).size.width >= 600 ? () => {stateMethod(journal[i].id)}
            : () => { Navigator.of(context).pushNamed('detail', arguments: {'entry': journal[i]})
          },
        ));
      },
    );
  }
}
