// ignore: file_names
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class httpApiClass extends StatefulWidget {
  httpApiClass({Key? key}) : super(key: key);

  @override
  _httpApiClassState createState() => _httpApiClassState();
}

class _httpApiClassState extends State<httpApiClass> {
  List pst = [];
  Future getPost() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var response = await http.get(url);
    // convert result from json to list
    var responseList = jsonDecode(response.body);

    setState(() {
      pst.addAll(responseList);
    });

    print(pst);
  }

  @override
  void initState() {
    getPost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("HTTP & API"),
        ),
        body: pst == null || pst.isEmpty
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: pst.length,
                itemBuilder: (context, i) {
                  return Container(
                      margin: EdgeInsets.all(5),
                      child: Text("${pst[i]['title']}"),
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(width: 1.0, color: Colors.grey))));
                }));
  }
}
