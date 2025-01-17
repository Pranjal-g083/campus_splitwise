import 'package:campus_splitwise/services/database.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:campus_splitwise/src/authenticate/register.dart';
import 'package:campus_splitwise/src/authenticate/signin.dart';
import 'package:campus_splitwise/services/auth.dart';

class Authenticate extends StatefulWidget {
  // const Authenticate({Key? key}) : super(key: key);

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  final AuthService _auth = AuthService();
  final DatabaseService _db = DatabaseService();
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.white,
                minimumSize: Size(double.infinity, 50),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(Register.id);
              },
              child: Text(
                'Sign Up',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.white,
                minimumSize: Size(double.infinity, 50),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(SignIn.id);
              },
              child: Text(
                'Sign In',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.white,
                minimumSize: Size(double.infinity, 50),
              ),
              icon: FaIcon(FontAwesomeIcons.google),
              onPressed: () async {
                dynamic result = await _auth.googleLogIn();
                await _db.CreateUser(
                    result.uid, result.email, result.name);
                if (result == null) {
                  print("ERROR!!");
                } else {
                  print("GR* SUCSES");
                }
              },
              label: Text('Sign In with Google'),
            ),
            Spacer(),
          ],
        ));
  }
}
