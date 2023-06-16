import 'package:blockvault_investment_flutter/controllers/auth_controller.dart';
import 'package:blockvault_investment_flutter/pages/authentication/landingpage.dart';
import 'package:blockvault_investment_flutter/pages/authentication/login.dart';
import 'package:blockvault_investment_flutter/pages/authentication/widgets/bottom_bar.dart';
import 'package:blockvault_investment_flutter/pages/authentication/widgets/explore_drawer.dart';
import 'package:blockvault_investment_flutter/pages/authentication/widgets/header.dart';
import 'package:blockvault_investment_flutter/pages/authentication/widgets/responsive.dart';
import 'package:blockvault_investment_flutter/utils/loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0;
  double _opacity = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  final TextEditingController firstNameController = TextEditingController();

  final TextEditingController lastNameController = TextEditingController();

  final TextEditingController usernameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  final AuthController controller = Get.put(AuthController());

  bool isApiCallProcess = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height * 0.40
        ? _scrollPosition / (screenSize.height * 0.40)
        : 1;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: ResponsiveWidget.isSmallScreen(context)
          ? AppBar(
              backgroundColor: Colors.blueGrey.shade900,
              elevation: 0,
              title: TextButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      CupertinoPageRoute(builder: (context) => LandingPage()),
                      (Route<dynamic> route) => false);
                },
                child: Text(
                  'BLOCKVAULT INVESTMENT',
                  style: TextStyle(
                    color: Colors.blueGrey.shade100,
                    fontSize: 20,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                    letterSpacing: 3,
                  ),
                ),
              ),
            )
          : PreferredSize(
              preferredSize: Size(screenSize.width, 1000),
              child: TopBarContents(_opacity),
            ),
      drawer: ExploreDrawer(),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        controller: _scrollController,
        child: Column(
          children: [
            SizedBox(
              height: 150,
            ),
            PhysicalModel(
              color: Colors.white,
              elevation: 8,
              shadowColor: Colors.blueGrey.shade900,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: ResponsiveWidget.isSmallScreen(context) ? 400 : 800,
                height: 700,
                child: Row(
                  children: [
                    if (!ResponsiveWidget.isSmallScreen(context))
                      Container(
                        height: 700,
                        width:
                            ResponsiveWidget.isSmallScreen(context) ? 0 : 400,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20)),
                            image: DecorationImage(
                              image: AssetImage("assets/Profit sharing.jpeg"),
                              fit: BoxFit.cover,
                              filterQuality: FilterQuality.high,
                            )),
                      ),
                    Container(
                      width:
                          ResponsiveWidget.isSmallScreen(context) ? 400 : 400,
                      height: 700,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 30, top: 50),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Register with us",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                              cursorColor: const Color.fromRGBO(39, 39, 39, 1),
                              style: const TextStyle(
                                  color: Color.fromRGBO(39, 39, 39, 1),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                              textInputAction: TextInputAction.done,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        const Color.fromRGBO(237, 239, 245, 1),
                                  ),
                                ),
                                hintText: "First name",
                                hintStyle: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(201, 201, 201, 1)),
                              ),
                              controller: firstNameController,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              cursorColor: const Color.fromRGBO(39, 39, 39, 1),
                              style: const TextStyle(
                                  color: Color.fromRGBO(39, 39, 39, 1),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                              textInputAction: TextInputAction.done,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        const Color.fromRGBO(237, 239, 245, 1),
                                  ),
                                ),
                                hintText: "Last name",
                                hintStyle: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(201, 201, 201, 1)),
                              ),
                              controller: lastNameController,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              cursorColor: const Color.fromRGBO(39, 39, 39, 1),
                              style: const TextStyle(
                                  color: Color.fromRGBO(39, 39, 39, 1),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                              textInputAction: TextInputAction.done,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        const Color.fromRGBO(237, 239, 245, 1),
                                  ),
                                ),
                                hintText: "Username",
                                hintStyle: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(201, 201, 201, 1)),
                              ),
                              controller: usernameController,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              cursorColor: const Color.fromRGBO(39, 39, 39, 1),
                              style: const TextStyle(
                                  color: Color.fromRGBO(39, 39, 39, 1),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                              textInputAction: TextInputAction.done,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        const Color.fromRGBO(237, 239, 245, 1),
                                  ),
                                ),
                                hintText: "Email",
                                hintStyle: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(201, 201, 201, 1)),
                              ),
                              controller: emailController,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              cursorColor: const Color.fromRGBO(39, 39, 39, 1),
                              obscureText: true,
                              style: const TextStyle(
                                  color: Color.fromRGBO(39, 39, 39, 1),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                              textInputAction: TextInputAction.done,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        const Color.fromRGBO(237, 239, 245, 1),
                                  ),
                                ),
                                hintText: "Password",
                                hintStyle: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(201, 201, 201, 1)),
                              ),
                              onChanged: (value) {
                                setState(() {});
                              },
                              controller: passwordController,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              cursorColor: const Color.fromRGBO(39, 39, 39, 1),
                              obscureText: true,
                              style: const TextStyle(
                                  color: Color.fromRGBO(39, 39, 39, 1),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                              textInputAction: TextInputAction.done,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        const Color.fromRGBO(237, 239, 245, 1),
                                  ),
                                ),
                                hintText: "Confirm Password",
                                hintStyle: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(201, 201, 201, 1)),
                              ),
                              onChanged: (value) {
                                setState(() {});
                              },
                              controller: confirmPasswordController,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 30),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  if (firstNameController.text.isEmpty) {
                                    setState(() {
                                      isLoading = false;
                                    });
                                    Get.snackbar(
                                        'Error', 'please enter first name');
                                  } else if (lastNameController.text.isEmpty) {
                                    setState(() {
                                      isLoading = false;
                                    });
                                    Get.snackbar('Error',
                                        'please enter your correct last name');
                                  } else if (usernameController.text.isEmpty) {
                                    setState(() {
                                      isLoading = false;
                                    });
                                    Get.snackbar('Error',
                                        'please enter your correct username');
                                  } else if (emailController.text.isEmpty) {
                                    setState(() {
                                      isLoading = false;
                                    });
                                    Get.snackbar('Error',
                                        'please enter your correct last name');
                                  } else if (passwordController.text.isEmpty &&
                                      confirmPasswordController.text.isEmpty &&
                                      passwordController.text !=
                                          confirmPasswordController.text) {
                                    setState(() {
                                      isLoading = false;
                                    });
                                    Get.snackbar('Error',
                                        'please enter your a valid password and make sure corfirm password is thesame as password');
                                  } else {
                                    controller.createUser(
                                        emailController.text.trim(),
                                        passwordController.text.trim(),
                                        usernameController.text,
                                        firstNameController.text,
                                        lastNameController.text);
                                    setState(() {
                                      isLoading = false;
                                    });
                                  }
                                },
                                child: Container(
                                  height: 50,
                                  width: MediaQuery.of(context).size.width,
                                  color: Colors.lightGreen,
                                  child: Center(
                                    child: Text(
                                      isLoading == true
                                          ? 'Loading...'
                                          : "Sign Up",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Already have an account? ",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        CupertinoPageRoute(
                                            builder: (context) => LoginPage()),
                                        (Route<dynamic> route) => false);
                                  },
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.redAccent),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            BottomBar()
          ],
        ),
      ),
    );
  }
}
