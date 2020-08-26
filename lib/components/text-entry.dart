import 'package:flutter/material.dart';

class TextEntry extends StatelessWidget {
  final String title;
  final int min;
  final int max;
  final Function(String value) entryMethod;

  TextEntry({Key key, this.title, this.min, this.max, this.entryMethod})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.multiline,
      minLines: min,
      maxLines: max,
      decoration: InputDecoration(
        labelText: title,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(),
      ),
      onSaved: (value) {
        entryMethod(value);
      },
      validator: (value) => value.isEmpty ? 'Cannot be blank' : null,
    );
  }
}
