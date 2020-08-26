import 'package:flutter/material.dart';

class DatePicker extends StatelessWidget {
  final TextEditingController controller;
  final Function() selectionMethod;

  DatePicker({Key key, this.controller, this.selectionMethod})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: 'Date',
        border: OutlineInputBorder(),
      ),
      onTap: () async {
        selectionMethod();
        FocusScope.of(context).unfocus();
      },
    );
  }
}
