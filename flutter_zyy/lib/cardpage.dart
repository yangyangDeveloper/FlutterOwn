
import 'dart:ui';
import 'package:flutter/material.dart';

class cardpage extends StatelessWidget {
  const cardpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text('Yang Card'),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 40, 30, 0),
        child: Column (
          crossAxisAlignment: CrossAxisAlignment.start,
           children: <Widget> [
             const Center(
              child: CircleAvatar(
                backgroundImage: const AssetImage('assets/16502640932167.jpg'),
                radius: 60,
              ),
            ),
             const Divider(height: 60,color: Colors.white),
             const Text(
              '姓名',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2,
              ),
            ),
             SizedBox(height: 10),

             const Text(
              '张洋洋',
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 2,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
             SizedBox(height: 30),
             const Text(
              '部门',
              style:  TextStyle(color: Colors.grey, letterSpacing: 2),
            ),
             SizedBox(height: 10),
             const Text(
              '技术部',
              style:  TextStyle(
                color: Colors.white,
                letterSpacing: 2,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
             SizedBox(height: 30),
             Row(
              children: <Widget> [
                const Icon(
                  Icons.email,
                  color: Colors.greenAccent,
                ),
                const SizedBox(width: 10),
                Text(
                  'yangyangzhang',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 18,
                    letterSpacing: 1
                  ),
                ),
              ],
            ),
          ],
        )
      ),
    );
  }
}
