import 'package:flutter/material.dart';

class InstagramCard extends StatefulWidget {
  var userPic, userName, photoURL, caption;
  InstagramCard(this.userPic, this.userName, this.photoURL, this.caption);
  @override
  _InstagramCardState createState() =>
      _InstagramCardState(userPic, userName, photoURL, caption);
}

class _InstagramCardState extends State<InstagramCard> {
  var userPic, userName, photoURL, caption;
  _InstagramCardState(this.userPic, this.userName, this.photoURL, this.caption);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 20.0,
                  child: ClipOval(
                    child: Image.network(this.userPic),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                  child: Text(
                    this.userName,
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
                  ),
                )
              ],
            ),
          ),
          Image.network(this.photoURL),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[Icon(Icons.add)],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[Container(child: Text(this.caption))],
            ),
          )
        ],
      ),
    );
  }
}
