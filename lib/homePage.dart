import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // var api = Uri.parse(
  //     "https://api.pexels.com/v1/search? query='+qury+'&per_page=80&page=2'");

  var api = Uri.parse(
      "https://api.pexels.com/v1/search?query=nature&per_page=80&page=2");
  // var api =
  //     Uri.parse("https://api.pexels.com/v1/search?query=nature&per_page=1");

  var images;

  StreamController imgStream = StreamController();

  @override
  void initState() {
    super.initState();
    fetching();
  }

  Future fetching() async {
    var apiKey = '563492ad6f91700001000001b6df629d92e84ed783770548c6269db3';
    http.Response res = await http.get(
      api,
      headers: {HttpHeaders.authorizationHeader: apiKey},
    );

    images = jsonDecode(res.body)["photos"];
    imgStream.add(jsonDecode(res.body));

    setState(() {});
    print(res.body);
  }

  // httpRequest() async {
  //   fetching().then((value) {
  //     imgStream.sink.add(value);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: StreamBuilder(
              stream: imgStream.stream,
              builder: (context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  print('no');
                  return Container(
                    child: Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 6,
                      ),
                    ),
                  );
                }
                return CustomScrollView(
                  slivers: [
                    SliverGrid(
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200.0,
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 10.0,
                        childAspectRatio: 0.75,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return Column(
                            children: [
                              Expanded(
                                child: Card(
                                    child: Image.network(
                                  snapshot.data["photos"][index]['src']
                                      ['original'],
                                  fit: BoxFit.cover,
                                )),
                              ),
                            ],
                          );
                        },
                        childCount: snapshot.data["photos"].length,
                      ),
                    ),
                  ],
                  scrollDirection: Axis.vertical,
                );
              })),
    );
  }
}


                  



// Container(
//             child: TextField(
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 20),
//             ),
//           ),



// SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: GridView.builder(
//             gridDelegate:
//                 SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//             itemCount: 10,
//             itemBuilder: (context, index) =>
//                 Container(color: Colors.pink, height: 20, width: 30)),
//       ),