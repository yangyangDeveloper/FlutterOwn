import 'dart:ui';
import 'package:flutter/material.dart';

class list4 extends StatelessWidget {
  const list4({Key? key}) : super(key: key);

  // #docregion list
  Widget _buildList() {
    return ListView(
      children: [
        _tile('河南省', '中国', "assets/16502640932167.jpg"),
        _tile('The Castro Theater', '429 Castro St', "assets/16502640932167.jpg"),
        _tile('Alamo Drafthouse Cinema', '2550 Mission St', "assets/16502640932167.jpg"),
        _tile('AMC Metreon 16', '135 4th St #3000', "assets/16502640932167.jpg"),
        const Divider(),
        _tile('K\'s Kitchen', '757 Monterey Blvd', "assets/16502640932167.jpg"),
        _tile('Emmy\'s Restaurant', '1923 Ocean Ave', "assets/16502640932167.jpg"),
      ],
    );
  }

  ListTile _tile(String title, String subtitle, String imagestr) {
    return ListTile(
      title: Text(title,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
          )),
      subtitle: Text(subtitle),
      leading: Image.asset(
        imagestr,
        color: Colors.blue[500],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('666'),
      ),
      body: Center(child: _buildList()),
    );
  }
}

