// ignore_for_file: prefer_const_constructors

import 'package:apiassignment/api_services.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<SamplePost> samplepost = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data From Api"),
        elevation: 0,
      ),
      body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: samplepost.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      // height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Center(
                              child: Image.network(
                                  '${samplepost[index].thumbnailUrl}')),
                          Text(
                            'Id : User ${samplepost[index].id}',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            'Title : ${samplepost[index].title}',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            " Url : ${samplepost[index].url} ",
                            style: TextStyle(fontSize: 18),
                          ),
                          // Text(
                          //   " Thumbnail Url : Url Here ",
                          //   style: TextStyle(fontSize: 18),
                          // ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  Future<List<SamplePost>> getData() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        samplepost.add(SamplePost.fromJson(index));
      }
      return samplepost;
    } else {
      return samplepost;
    }
  }
}
