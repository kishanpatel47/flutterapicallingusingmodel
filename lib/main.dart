import 'dart:convert';

import 'package:api/Autogererate.dart';
import 'package:api/second.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as logdav;

void main() {
  runApp(const Apicalling());
}

class Apicalling extends StatefulWidget {
  const Apicalling({Key? key}) : super(key: key);

  @override
  State<Apicalling> createState() => _ApicallingState();
}

class _ApicallingState extends State<Apicalling> {
  final List<apidata> apilist = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    datafetching();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: FutureBuilder(
              future: datafetching(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Container(
                            width: 100,
                            color: Colors.amber,
                            margin: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    secondclass(
                                                      res: apidata[index]
                                                          .toString(),
                                                    )));
                                      },
                                      child: Text(
                                        'User is :${apilist[index].title}',
                                        style: TextStyle(fontSize: 20),
                                      )),
                                  Text(
                                    'User is :${apilist[index].title}',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Text(
                                    'User is :${apilist[index].userId}',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ]));
                      });
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              })),
    );
  }

  Future<List<apidata>> datafetching() async {
    var res =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    var data = jsonDecode(res.body.toString());

    if (res.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        apilist.add(apidata.fromJson(index));
      }
      return apilist;
    }

    return apilist;
  }
}
