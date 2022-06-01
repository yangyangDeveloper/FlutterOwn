
import 'package:flutter/material.dart';
import 'package:flutter_zyy/Browser.dart';
import 'package:shared_preferences/shared_preferences.dart';

class list6 extends StatefulWidget {
  const list6({Key? key}) : super(key: key);

  @override
  _list6State createState() => _list6State();
}



class _list6State extends State<list6> {

  SharedPreferences? prefs;
  TextEditingController controller = new TextEditingController();
  String name="";

  go() async{
    print('点击 go');
    prefs = await SharedPreferences.getInstance();
    name = prefs?.getString("username") ?? "";
    setState(() {

    });
  }

  retrieve() async{
    print('点击 retrieve');
    prefs = await SharedPreferences.getInstance();
    name = prefs?.getString("username") ?? "";
    setState(() {

    });
  }

  save() async
  {
    print('点击 save');
    prefs = await SharedPreferences.getInstance();
    prefs?.setString("username", controller.text.toString());
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return new  Scaffold(
      appBar: AppBar(
        title: Text("Flutter缓存"),
      ),
      body:Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              Text(
                '$name',
                style: Theme.of(context).textTheme.headline4,
              ),

              SizedBox(
                height:30,
              ),
              Text(name, style: TextStyle(fontSize: 20),),
              SizedBox(
                height:30,
              ),
              ElevatedButton(
                child:Text("Save"),
                onPressed: ()
                {
                  save();
                },
              ),
              ElevatedButton(
                child:Text("retrieve"),
                onPressed: ()
                {
                  retrieve();
                },
              ),
              ElevatedButton(
                child:Text("跳转"),
                onPressed: ()
                {
                  go();
                },
              ),
            ],
          )
      ),
    );;
  }
}

