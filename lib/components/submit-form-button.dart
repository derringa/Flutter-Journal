import 'package:flutter/material.dart';
import '../models/journal-entry.dart';
import '../models/database.dart';

class SubmitFormButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final JournalEntry entry;
  final JournalDatabase db = JournalDatabase.initDB(dbName: 'journal.db');
  final Function() update;

  SubmitFormButton({Key key, this.formKey, this.entry, this.update})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () async {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          db.insertDB(entry);
          update();
          Navigator.of(context).pop();
        }
      },
      child: Text('Save'),
    );
  }
}
