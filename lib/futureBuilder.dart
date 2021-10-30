import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FutureBuilderClass extends StatefulWidget {
  FutureBuilderClass({Key? key}) : super(key: key);

  @override
  _FutureBuilderClassState createState() => _FutureBuilderClassState();
}

class _FutureBuilderClassState extends State<FutureBuilderClass> {
  Future getPost() async {
    var url =
        Uri.parse('https://jsonplaceholder.typicode.com/posts?userId=3&id=27');
    //  ?id=value&userId=value
    var response = await http.get(url);
    // convert result from json to list
    var responseList = jsonDecode(response.body);
    return responseList;
  }

  addPosts() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var response = await http.post(url, body: {
      "title": 'foo',
      "body": 'bar',
      "userId": '1',
    });
    var responseBody = jsonDecode(response.body);
    print(response.body);
    return responseBody;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("HTTP & API"),
        ),
        body: ListView(
          children: [
            MaterialButton(
                child: Text("Post method "),
                onPressed: () {
                  addPosts();
                }),
            FutureBuilder(
                future: getPost(),
                // el resultat mte3 el getPost() tetkhazan fl snapshot
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (!snapshot.hasData || snapshot.data == null) {
                    return Container();
                  }
                  return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      // wa9t .length ta3ti error ! lazem nzidou AsyncSnapshot ll type mte3 el snapshot
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, i) {
                        return Container(
                            margin: EdgeInsets.all(5),
                            child: Text("${snapshot.data[i]['title']}"),
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 1.0, color: Colors.grey))));
                      });
                }),
          ],
        ));
  }
}
