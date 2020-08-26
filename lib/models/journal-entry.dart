import 'package:intl/intl.dart';

class JournalEntry {
  JournalEntry({this.date, this.title, this.body, this.rating, this.id});
  int id;
  int date;
  String title;
  String body;
  double rating;

  String repr() {
    return 'Date: $date, title: $title, body: $body, rating: $rating';
  }

  void setTitle(String value) {
    title = value;
  }

  void setBody(String value) {
    body = value;
  }

  String getStyledDate() {
    DateFormat formatter = DateFormat('yMMMMEEEEd');
    return formatter.format(DateTime.fromMillisecondsSinceEpoch(date));
  }
}
