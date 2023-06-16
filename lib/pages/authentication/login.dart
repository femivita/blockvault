import 'package:blockvault_investment_flutter/controllers/auth_controller.dart';
import 'package:blockvault_investment_flutter/pages/authentication/landingpage.dart';
import 'package:blockvault_investment_flutter/pages/authentication/signup.dart';
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

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0;
  double _opacity = 0;
  bool isLoading = false;

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

  final AuthController controller = Get.put(AuthController());

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  bool isApiCallProcess = false;

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
                height: 600,
                child: Row(
                  children: [
                    if (!ResponsiveWidget.isSmallScreen(context))
                      Container(
                        height: 600,
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
                      height: 600,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 30, top: 50),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hello,",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "Welcome Back",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              "Login to manage your account",
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 5,
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
                              controller: passwordController,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "Forgot your password?",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 30),
                              child: GestureDetector(
                                onTap: () async {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  if (emailController.text.trim() ==
                                      'admin@gmail.com') {
                                    controller.adminLogin(
                                        emailController.text.trim(),
                                        passwordController.text.trim());
                                    setState(() {
                                      isLoading = false;
                                    });
                                  } else {
                                    if (emailController.text.trim().isEmpty) {
                                      setState(() {
                                        isLoading = false;
                                      });
                                      Get.snackbar(
                                        'Error',
                                        'please enter your email',
                                        snackPosition: SnackPosition.TOP,
                                      );
                                    } else if (passwordController.text
                                        .trim()
                                        .isEmpty) {
                                      setState(() {
                                        isLoading = false;
                                      });
                                      Get.snackbar(
                                        'Error',
                                        'please enter your password',
                                        snackPosition: SnackPosition.TOP,
                                      );
                                    } else {
                                      controller.login(emailController.text,
                                          passwordController.text);
                                      setState(() {
                                        isLoading = false;
                                      });
                                    }
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
                                          : "Login",
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
                                  "Don't have an account? ",
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
                                            builder: (context) => SignUpPage()),
                                        (Route<dynamic> route) => false);
                                  },
                                  child: Text(
                                    "Signup",
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
