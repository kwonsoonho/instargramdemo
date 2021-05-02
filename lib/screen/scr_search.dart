import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:instargramdemo/screen/scr_create.dart';
import 'package:instargramdemo/screen/scr_detail.dart';

class SearchPage extends StatefulWidget {
  final User user;

  SearchPage(this.user);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CreatePage(widget.user)));
        },
        backgroundColor: Colors.blue,
        child: Icon(
          Icons.create,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildBody() {
    return StreamBuilder(
      stream: Firestore.instance.collection('post').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          var items = snapshot.data?.documents ?? [];
          return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.0,
                  mainAxisSpacing: 1.0,
                  crossAxisSpacing: 1.0),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return _buildListItem(context, items[index]);
              });
        }
      },
    );
  }

  // Widget _buildBody() {
  //   return GridView.builder(
  //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //           crossAxisCount: 3,
  //           childAspectRatio: 1.0,
  //           mainAxisSpacing: 1.0,
  //           crossAxisSpacing: 1.0),
  //       itemCount: 10,
  //       itemBuilder: (context, index) {
  //         return _buildListItem(context, index);
  //       });
  // }

  // Widget _buildListItem(context, document) {
  //   return Stack(
  //       children: [
  //     Image.network(
  //       document['photoUrl'],
  //       fit: BoxFit.cover,
  //     ),
  //     Text(document['displayName'])
  //   ]);
  // }
  Widget _buildListItem(context, document) {
    return Hero(
      tag: document['photoUrl'],
      child: Material(
        child: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailPostPage(document);
            }));
          },
          child: Image.network(
            document['photoUrl'],
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
