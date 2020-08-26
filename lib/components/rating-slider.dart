import 'package:flutter/material.dart';

class RatingSlider extends StatelessWidget {
  final double rating;
  final Function(double rating) stateMethod;

  RatingSlider({Key key, this.rating, this.stateMethod}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text('Rating:'),
        Expanded(
          child: Slider(
            value: rating,
            min: 1,
            max: 5,
            onChanged: (newRating) {
              stateMethod(newRating);
            },
            divisions: 4,
            label: '$rating',
          ),
        ),
      ],
    );
  }
}
