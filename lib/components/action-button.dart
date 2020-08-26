import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final Function() stateMethod;

  ActionButton ({Key key, this.stateMethod}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      right: 0,
      child: RawMaterialButton(
        onPressed: () => {
          Navigator.of(context)
              .pushNamed('entry', arguments: {'update': stateMethod})
        },
        //elevation: 2.0,
        fillColor: Colors.deepOrange,
        child: Icon(
          CupertinoIcons.pen,
          size: 35.0,
          color: Colors.white,
        ),
        padding: EdgeInsets.all(15.0),
        shape: CircleBorder(),
      ),
    );
  }
}
