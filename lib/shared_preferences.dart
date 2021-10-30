import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class Shared_PreferencesClass extends StatefulWidget {
  Shared_PreferencesClass({Key? key}) : super(key: key);

  @override
  _Shared_PreferencesClassState createState() =>
      _Shared_PreferencesClassState();
}

class _Shared_PreferencesClassState extends State<Shared_PreferencesClass> {
  savePrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString("name", "Rabii3");
    prefs.setString("lastName", "BenJouira");
    prefs.setString("hope", "working at google <3");
    print("success");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("shared Preferences"),
      ),
      body: Center(
        child: Column(
          children: [
            MaterialButton(
              onPressed: () async {
                await savePrefs();
              },
              child: const Text("Save Prefs"),
            ),
            const Divider(
              color: Colors.blue,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pushNamed("two");
              },
              child: const Text("Go to page Two"),
            ),
          ],
        ),
      ),
    );
  }
}
