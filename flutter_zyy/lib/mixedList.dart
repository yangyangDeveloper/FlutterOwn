import 'package:flutter/material.dart';

abstract class ListItem {
  /// The title line to show in a list item.
  Widget buildTitle(BuildContext context);

  /// The subtitle line, if any, to show in a list item.
  Widget buildSubtitle(BuildContext context);
}

/// A ListItem that contains data to display a heading.
class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);

  @override
  Widget buildTitle(BuildContext context) {
    return Text(
      heading,
      style: Theme.of(context).textTheme.headline5,
    );
  }

  @override
  Widget buildSubtitle(BuildContext context) => const SizedBox.shrink();
}

/// A ListItem that contains data to display a message.
class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);

  @override
  Widget buildTitle(BuildContext context) => Text(sender);

  @override
  Widget buildSubtitle(BuildContext context) => Text(body);
}


class mixedList extends StatefulWidget {
  const mixedList({Key? key}) : super(key: key);

  @override
  _mixedListState createState() => _mixedListState();
}



class _mixedListState extends State<mixedList> {

  final items = List<ListItem>.generate(
    1000,
        (i) => i % 6 == 0
        ? HeadingItem('Heading $i')
        : MessageItem('Sender $i', 'Message body $i'),
  );


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "1111",
      home: Scaffold(
        appBar: AppBar(
          title: Text("2222"),
        ),
        body: ListView.builder(

          itemCount: items.length,

          itemBuilder: (context, index) {
            final item = items[index];

            return ListTile(
              title: item.buildTitle(context),
              subtitle: item.buildSubtitle(context),
            );
          },
        ),
      ),
    );
  }
}
