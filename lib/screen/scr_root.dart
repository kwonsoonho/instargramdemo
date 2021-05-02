import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instargramdemo/screen/scr_login.dart';
import 'package:instargramdemo/screen/scr_tab.dart';

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if(snapshot.hasData){
          return TabPage(snapshot.data);
        } else {
          return LoginPage();
        }
      },
    );
  }
// Widget buildLoading() => Center(child: CircularProgressIndicator(),);
}
