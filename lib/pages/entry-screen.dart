import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import '../models/journal-entry.dart';
import '../components/text-entry.dart';
import '../components/date-picker.dart';
import '../components/submit-form-button.dart';
import '../components/rating-slider.dart';

class EntryScreen extends StatefulWidget {
  @override
  _EntryScreenState createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen> {
  final _formKey = GlobalKey<FormState>();
  final DateFormat formatter = DateFormat('yMMMMEEEEd');
  final TextEditingController dateController = TextEditingController();
  final entry = JournalEntry();

  void initState() {
    super.initState();
    entry.date = DateTime.now().millisecondsSinceEpoch;
    dateController.text = formatter.format(DateTime.now());
    entry.rating = 3.0;
  }

  void updateRating(double newRating) {
    setState(() {
      entry.rating = newRating;
    });
  }

  Future selectDate() async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(1980),
      lastDate: new DateTime.now().add(Duration(days: 365)),
    );
    dateController.text =
        picked == null ? dateController.text : formatter.format(picked);
    setState(() {
      entry.date = picked == null ? entry.date : picked.millisecondsSinceEpoch;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Map args = ModalRoute.of(context).settings.arguments as Map;
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.all(10),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DatePicker(controller: dateController, selectionMethod: selectDate),
            SizedBox(height: 10),
            TextEntry(
                title: 'Title', min: 1, max: 1, entryMethod: entry.setTitle),
            SizedBox(height: 10),
            TextEntry(
                title: 'Entry', min: 4, max: null, entryMethod: entry.setBody),
            SizedBox(height: 10),
            RatingSlider(
              rating: entry.rating,
              stateMethod: updateRating,
            ),
            SizedBox(height: 10),
            SubmitFormButton(
                formKey: _formKey, entry: entry, update: args['update']),
          ],
        ),
      ),
    ));
  }
}
