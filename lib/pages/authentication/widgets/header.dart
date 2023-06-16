import 'package:blockvault_investment_flutter/pages/authentication/landingpage.dart';
import 'package:blockvault_investment_flutter/pages/authentication/login.dart';
import 'package:blockvault_investment_flutter/pages/authentication/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopBarContents extends StatefulWidget {
  final double opacity;

  TopBarContents(this.opacity);

  @override
  _TopBarContentsState createState() => _TopBarContentsState();
}

class _TopBarContentsState extends State<TopBarContents> {
  final List _isHovering = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return PreferredSize(
      preferredSize: Size(screenSize.width, 10),
      child: Container(
        child: Column(
          children: [
            Container(
              color: Color.fromRGBO(28, 34, 55, 1),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                context,
                CupertinoPageRoute(builder: (context) => LandingPage()),
                (Route<dynamic> route) => false);
                      },
                      child: Text(
                        'BLOCKVAULT INVESTMENT',
                        style: TextStyle(
                          color: Color.fromRGBO(255, 208, 81, 1),
                          fontSize: 20,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w400,
                          letterSpacing: 3,
                        ),
                      ),
                    ),
                    // Expanded(
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.start,
                    //     children: [
                    //       SizedBox(width: screenSize.width / 8),
                    //       InkWell(
                    //         onHover: (value) {
                    //           setState(() {
                    //             value
                    //                 ? _isHovering[0] = true
                    //                 : _isHovering[0] = false;
                    //           });
                    //         },
                    //         onTap: () {},
                    //         child: Column(
                    //           mainAxisSize: MainAxisSize.min,
                    //           children: [
                    //             Text(
                    //               'Discover',
                    //               style: TextStyle(
                    //                 color: _isHovering[0]
                    //                     ? Colors.blue.shade200
                    //                     : Colors.white,
                    //               ),
                    //             ),
                    //             SizedBox(height: 5),
                    //             Visibility(
                    //               maintainAnimation: true,
                    //               maintainState: true,
                    //               maintainSize: true,
                    //               visible: _isHovering[0],
                    //               child: Container(
                    //                 height: 2,
                    //                 width: 20,
                    //                 color: Colors.white,
                    //               ),
                    //             )
                    //           ],
                    //         ),
                    //       ),
                    //       SizedBox(width: screenSize.width / 20),
                    //       InkWell(
                    //         onHover: (value) {
                    //           setState(() {
                    //             value
                    //                 ? _isHovering[1] = true
                    //                 : _isHovering[1] = false;
                    //           });
                    //         },
                    //         onTap: () {},
                    //         child: Column(
                    //           mainAxisSize: MainAxisSize.min,
                    //           children: [
                    //             Text(
                    //               'Contact Us',
                    //               style: TextStyle(
                    //                 color: _isHovering[1]
                    //                     ? Colors.blue[200]
                    //                     : Colors.white,
                    //               ),
                    //             ),
                    //             SizedBox(height: 5),
                    //             Visibility(
                    //               maintainAnimation: true,
                    //               maintainState: true,
                    //               maintainSize: true,
                    //               visible: _isHovering[1],
                    //               child: Container(
                    //                 height: 2,
                    //                 width: 20,
                    //                 color: Colors.white,
                    //               ),
                    //             )
                    //           ],
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    Row(
                      children: [
                        InkWell(
                      onHover: (value) {
                        setState(() {
                          value ? _isHovering[2] = true : _isHovering[2] = false;
                        });
                      },
                      onTap: () {
                                  Navigator.pushAndRemoveUntil(
                context,
                CupertinoPageRoute(builder: (context) => SignUpPage()),
                (Route<dynamic> route) => false);
                                },
                      child: Container(
                        height: 40,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color.fromRGBO(255, 208, 81, 1)
                        ),
                        child: Center(
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              color: _isHovering[2] ? Colors.white : Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: screenSize.width / 50,
                    ),
                    InkWell(
                      onHover: (value) {
                        setState(() {
                          value ? _isHovering[3] = true : _isHovering[3] = false;
                        });
                      },
                      onTap: () {
                                  Navigator.pushAndRemoveUntil(
                context,
                CupertinoPageRoute(builder: (context) => LoginPage()),
                (Route<dynamic> route) => false);
                                },
                      child: Container(
                        height: 40,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color.fromRGBO(255, 208, 81, 1)
                        ),
                        child: Center(
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: _isHovering[3] ? Colors.white : Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                      ),
                    ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}