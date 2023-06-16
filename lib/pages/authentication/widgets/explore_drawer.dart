import 'package:blockvault_investment_flutter/pages/authentication/login.dart';
import 'package:blockvault_investment_flutter/pages/authentication/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExploreDrawer extends StatelessWidget {
  const ExploreDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color.fromRGBO(28, 34, 55, 1),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      CupertinoPageRoute(builder: (context) => LoginPage()),
                      (Route<dynamic> route) => false);
                },
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: Divider(
                  color: Colors.blueGrey.shade400,
                  thickness: 2,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      CupertinoPageRoute(builder: (context) => SignUpPage()),
                      (Route<dynamic> route) => false);
                },
                child: Text(
                  'Sign Up',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: Divider(
                  color: Colors.blueGrey.shade400,
                  thickness: 2,
                ),
              ),
              // InkWell(
              //   onTap: () {},
              //   child: Text(
              //     'Discover',
              //     style: TextStyle(color: Colors.white, fontSize: 22),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
              //   child: Divider(
              //     color: Colors.blueGrey.shade400,
              //     thickness: 2,
              //   ),
              // ),
              // InkWell(
              //   onTap: () {},
              //   child: Text(
              //     'Contact Us',
              //     style: TextStyle(color: Colors.white, fontSize: 22),
              //   ),
              // ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    'Copyright © 2023 | BLOCKVAULT INVESTMENT',
                    style: TextStyle(
                      color: Colors.blueGrey.shade300,
                      fontSize: 14,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
