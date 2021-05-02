import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instargramdemo/screen/scr_tab.dart';

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Instagrm Clon',
              style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
            ),
            Padding(padding: EdgeInsets.all(50.0)),
            SignInButton(
              Buttons.Google,
              onPressed: () {
                _handleSignIn().then((credential){
                  print(credential);
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TabPage(credential)));
                });
              },
            )
          ],
        ),
      ),
    );
  }

  Future<UserCredential> _handleSignIn() async{
    final GoogleSignInAccount googleUser = (await GoogleSignIn().signIn())!;
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken
    );
    // User user = await _auth.signInWithCredential(
    //   GoogleAuthProvider.getCredential(idToken: googleAuth.idToken, accessToken: googleAuth.accessToken)
    // );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
