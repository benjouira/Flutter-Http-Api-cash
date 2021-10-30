import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PageTwo extends StatefulWidget {
  PageTwo({Key? key}) : super(key: key);

  @override
  _PageTwoState createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  String? username;
  getPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString("name");
    });

    print("name = ${username!}");
  }

  deletePrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.remove("name");
      // pref.clear()
      // to delete all the prefs keys
    });
    print("prefs deleted !");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Page Two"),
        ),
        body: Center(
          child: Column(
            children: [
              Text("$username"),
              MaterialButton(
                onPressed: () {
                  getPrefs();
                },
                child: const Text("Get prefs"),
              ),
              MaterialButton(
                onPressed: () {
                  deletePrefs();
                },
                child: const Text("delete prefs"),
              )
            ],
          ),
        ));
  }
}
