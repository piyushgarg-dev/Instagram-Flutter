import 'package:flutter/material.dart';
import 'widgets/InstagramCard.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:requests/requests.dart';

void main() {
  runApp(MaterialApp(
    title: 'Instagram',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primaryColor: Color(0xffF3EFEF)),
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Instagram',
              style: TextStyle(fontFamily: 'Billabong', fontSize: 30.0),
            ),
            // Container(child: Icon(Icons.send))
          ],
        )),
        body: ApiHandler());
  }
}

class ApiHandler extends StatefulWidget {
  @override
  _ApiHandlerState createState() => _ApiHandlerState();
}

class _ApiHandlerState extends State<ApiHandler> {
  List data = [];

  Future getData() async {
    http.Response response =
        await http.get("https://quickstaygram.herokuapp.com/post");

    var resbody = await json.decode(response.body);

    setState(() {
      data = resbody;
    });

    return resbody;
  }

  _ApiHandlerState() {
    getData();
  }
  // Widget loadData() {
  //   return FutureBuilder(
  //     future: getData(),
  //     builder: (context, snapshot) {
  //       // return InstagramCard(userpic, username, posturl, caption);
  //       return Text('hwll');
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    // print(data);

    // return Text('Nul');
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (BuildContext cntx, int index) {
        print(data[index]['image']);
        return InstagramCard(data[index]['userpic'], data[index]['name'],
            data[index]['image'], data[index]['caption']);
      },
    );
  }
}

// InstagramCard(
//               'https://instagram.fdel1-4.fna.fbcdn.net/vp/0d06c1fb975f3f9cadc583308a517084/5E55428A/t51.2885-19/s150x150/41969363_1023326974510497_5588541476242980864_n.jpg?_nc_ht=instagram.fdel1-4.fna.fbcdn.net',
//               'Piyush Garg',
//               'https://quickstayrooms.com/image.png',
//               'My Custom Caption')
