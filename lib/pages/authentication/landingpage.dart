import 'package:blockvault_investment_flutter/pages/authentication/login.dart';
import 'package:blockvault_investment_flutter/pages/authentication/signup.dart';
import 'package:blockvault_investment_flutter/pages/authentication/widgets/bottom_bar.dart';
import 'package:blockvault_investment_flutter/pages/authentication/widgets/explore_drawer.dart';
import 'package:blockvault_investment_flutter/pages/authentication/widgets/header.dart';
import 'package:blockvault_investment_flutter/pages/authentication/widgets/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
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
              backgroundColor: Color.fromRGBO(28, 34, 55, 1),
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
        child: Column(
          children: [
            Container(
              color: Color.fromRGBO(28, 34, 55, 1),
              child: Padding(
                padding: const EdgeInsets.only(top: 75, bottom: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Divider(
                            color: Color.fromRGBO(255, 208, 81, 1),
                            height: 10,
                            thickness: 3,
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(left: 30, right: 30, top: 50),
                            child: Text(
                              "MAKING INVESTMENT EASIER",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: !ResponsiveWidget.isSmallScreen(context)
                          ? MediaQuery.of(context).size.width / 2.5
                          : MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: EdgeInsets.only(left: 30, right: 30, top: 30),
                        child: Text(
                          "GET DOUBLE BENEFITS FOR YOUR INVESTMENT WITH THE BLOCKVAULT INVESTMENT",
                          style: TextStyle(
                              fontSize: 45,
                              fontWeight: FontWeight.w700,
                              color: Color.fromRGBO(255, 208, 81, 1)),
                        ),
                      ),
                    ),
                    Container(
                      width: !ResponsiveWidget.isSmallScreen(context)
                          ? MediaQuery.of(context).size.width / 2.5
                          : MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: EdgeInsets.only(left: 30, right: 30, top: 30),
                        child: Text(
                          "Blockvault Investment offers you the returns of Gold while enjoying the Liquidity of Crypto",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 30, right: 30, top: 30),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => LoginPage()),
                              (Route<dynamic> route) => false);
                        },
                        child: Container(
                          height: 40,
                          width: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color.fromRGBO(255, 208, 81, 1)),
                          child: Center(
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                        width: !ResponsiveWidget.isSmallScreen(context)
                            ? 400
                            : MediaQuery.of(context).size.width,
                        height: 300,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 30, right: 30, top: 30),
                          child: Image.asset(
                            "assets/Profit sharing.jpeg",
                            filterQuality: FilterQuality.high,
                          ),
                        )),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Why People Choose Us",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w900,
                        color: Color.fromRGBO(28, 34, 55, 1),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Few Reasons We Standout",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                        color: Color.fromRGBO(255, 208, 81, 1),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "We have a group of qualified experts, traders and analysts who are specialized in Bitcoin, Forex, Stock, Bond, Futures, Currencies, USDT and Dodge trading",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(28, 34, 55, 1),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Registered and Regulated",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        color: Color.fromRGBO(255, 208, 81, 1),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Blockvault is Registered under UK Companies House and Duns & Bradstreet (USA). We are also regulated by Security Exchange Commission(SEC) & CFTC.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(28, 34, 55, 1),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Insured and Secured",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        color: Color.fromRGBO(255, 208, 81, 1),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Your investment is fully insured and secured. Your funds are protected by industry-leading security protocols and are FDIC Insured",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(28, 34, 55, 1),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "24/7 Supports",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        color: Color.fromRGBO(255, 208, 81, 1),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "We provide 24/7 customer support through e-mail and telegram. Our support representatives are periodically available to elucidate any difficulties.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(28, 34, 55, 1),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: Color.fromRGBO(28, 34, 55, 1),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 30, right: 30, top: 50, bottom: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            width: !ResponsiveWidget.isSmallScreen(context)
                                ? MediaQuery.of(context).size.width / 2.5
                                : MediaQuery.of(context).size.width,
                            child: Text(
                              "PROFIT SHARING TOKEN",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: !ResponsiveWidget.isSmallScreen(context)
                          ? MediaQuery.of(context).size.width / 2.5
                          : MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: Text(
                          "Backed by real crypto ‎mining operations.",
                          style: TextStyle(
                              fontSize: 45,
                              fontWeight: FontWeight.w700,
                              color: Color.fromRGBO(255, 208, 81, 1)),
                        ),
                      ),
                    ),
                    Container(
                      width: !ResponsiveWidget.isSmallScreen(context)
                          ? MediaQuery.of(context).size.width / 2.5
                          : MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: Text(
                          "Blockvault Investment is a Binance Smart Chain (BEP20) token that is backed by real crypto mining operations. Blockvault Investment Token acts as a PROFIT SHARING platform for indirect investments in several fully licensed and operational minings.",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                        width: !ResponsiveWidget.isSmallScreen(context)
                            ? MediaQuery.of(context).size.width / 2.5
                            : MediaQuery.of(context).size.width,
                        height: 300,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                "assets/Profit sharing.jpeg",
                                filterQuality: FilterQuality.high,
                                width: MediaQuery.of(context).size.width / 2.5,
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Build your investment without even trying",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w900,
                        color: Color.fromRGBO(28, 34, 55, 1),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Marrying Crypto Liquidity with High Returns On Investment (ROI)",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                        color: Color.fromRGBO(255, 208, 81, 1),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Turn on Round-up Rules and start saving up effortlessly. Whenever you make a purchase, Goals make it easy to save for the things you want or want to do. There’s no need for spreadsheets or extra apps to budget and track your money.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(28, 34, 55, 1),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "DODGE and USDT tokens can benefit from cryptocurrency features, while maintaining the potential for price appreciation from both markets.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(28, 34, 55, 1),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "The company has pledged to back the tokens 100% by reserves, with its own mining projects across the world.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(28, 34, 55, 1),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: Color.fromRGBO(28, 34, 55, 1),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 30, right: 30, top: 50, bottom: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: !ResponsiveWidget.isSmallScreen(context)
                                ? MediaQuery.of(context).size.width / 2.5
                                : MediaQuery.of(context).size.width,
                            child: Text(
                              "BLOCKVAULT INVESTMENT WALLET",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: !ResponsiveWidget.isSmallScreen(context)
                          ? MediaQuery.of(context).size.width / 2.5
                          : MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: Text(
                          "Now buy, Send, Invest your coin using the Blockvault Investment wallet",
                          style: TextStyle(
                              fontSize: 45,
                              fontWeight: FontWeight.w700,
                              color: Color.fromRGBO(255, 208, 81, 1)),
                        ),
                      ),
                    ),
                    Container(
                      width: !ResponsiveWidget.isSmallScreen(context)
                          ? MediaQuery.of(context).size.width / 2.5
                          : MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: Text(
                          "Blockvault Investment Wallet is exclusively developed for Blockvault Investors. Tokens will be available to BUY, SELL and TRADE using other Exchanges and Wallets aswell in the near future.",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                        width: !ResponsiveWidget.isSmallScreen(context)
                            ? 400
                            : MediaQuery.of(context).size.width,
                        height: 300,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20, top: 30),
                          child: Image.asset(
                            "assets/Profit sharing.jpeg",
                            filterQuality: FilterQuality.high,
                          ),
                        )),
                    SizedBox(
                      height: 40,
                    ),
                    !ResponsiveWidget.isSmallScreen(context)
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width / 4.7,
                                color: Colors.white,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 20, right: 20, top: 30, bottom: 20),
                                  child: Column(
                                    children: [
                                      Text(
                                        "STARTER PACK",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w800,
                                            color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "\$100",
                                        style: TextStyle(
                                            fontSize: 35,
                                            fontWeight: FontWeight.w900,
                                            color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Divider(
                                        color: Colors.black,
                                        thickness: 0,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Duration:",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            "5 Days",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Daily Profit:",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            "1.8%",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Minimum:",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            "\$100",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Maximum:",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            "\$999",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Referral:",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            "10%",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Divider(
                                        color: Colors.black,
                                        thickness: 0,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.pushAndRemoveUntil(
                                              context,
                                              CupertinoPageRoute(
                                                  builder: (context) =>
                                                      LoginPage()),
                                              (Route<dynamic> route) => false);
                                        },
                                        child: Container(
                                          height: 40,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Color.fromRGBO(
                                                  243, 156, 18, 1)),
                                          child: Center(
                                            child: Text(
                                              'Invest',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 4.7,
                                color: Colors.white,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 20, right: 20, top: 30, bottom: 20),
                                  child: Column(
                                    children: [
                                      Text(
                                        "STANDARD PACK",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w800,
                                            color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "\$1,000",
                                        style: TextStyle(
                                            fontSize: 35,
                                            fontWeight: FontWeight.w900,
                                            color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Divider(
                                        color: Colors.black,
                                        thickness: 0,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Duration:",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            "5 Days",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Daily Profit:",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            "2.5%",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Minimum:",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            "\$1,000",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Maximum:",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            "\$4,999",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Referral:",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            "10%",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Divider(
                                        color: Colors.black,
                                        thickness: 0,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.pushAndRemoveUntil(
                                              context,
                                              CupertinoPageRoute(
                                                  builder: (context) =>
                                                      LoginPage()),
                                              (Route<dynamic> route) => false);
                                        },
                                        child: Container(
                                          height: 40,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Color.fromRGBO(
                                                  243, 156, 18, 1)),
                                          child: Center(
                                            child: Text(
                                              'Invest',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 4.7,
                                color: Colors.white,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 20, right: 20, top: 30, bottom: 20),
                                  child: Column(
                                    children: [
                                      Text(
                                        "PREMIUM PACK",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w800,
                                            color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "\$5,000",
                                        style: TextStyle(
                                            fontSize: 35,
                                            fontWeight: FontWeight.w900,
                                            color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Divider(
                                        color: Colors.black,
                                        thickness: 0,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Duration:",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            "5 Days",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Daily Profit:",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            "3.0%",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Minimum:",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            "\$5,000",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Maximum:",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            "\$9,999",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "DReferral:",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            "10%",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Divider(
                                        color: Colors.black,
                                        thickness: 0,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.pushAndRemoveUntil(
                                              context,
                                              CupertinoPageRoute(
                                                  builder: (context) =>
                                                      LoginPage()),
                                              (Route<dynamic> route) => false);
                                        },
                                        child: Container(
                                          height: 40,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Color.fromRGBO(
                                                  243, 156, 18, 1)),
                                          child: Center(
                                            child: Text(
                                              'Invest',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 4.7,
                                color: Colors.white,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 20, right: 20, top: 30, bottom: 20),
                                  child: Column(
                                    children: [
                                      Text(
                                        "STARTER PACK",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w800,
                                            color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "\$10,000",
                                        style: TextStyle(
                                            fontSize: 35,
                                            fontWeight: FontWeight.w900,
                                            color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Divider(
                                        color: Colors.black,
                                        thickness: 0,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Duration:",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            "5 Days",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Daily Profit:",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            "3.5%",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Minimum:",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            "\$10,000",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Maximum:",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            "\$15,000",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Referral:",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            "10%",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Divider(
                                        color: Colors.black,
                                        thickness: 0,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.pushAndRemoveUntil(
                                              context,
                                              CupertinoPageRoute(
                                                  builder: (context) =>
                                                      LoginPage()),
                                              (Route<dynamic> route) => false);
                                        },
                                        child: Container(
                                          height: 40,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Color.fromRGBO(
                                                  243, 156, 18, 1)),
                                          child: Center(
                                            child: Text(
                                              'Invest',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          )
                        : Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                color: Colors.white,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 20, right: 20, top: 30, bottom: 20),
                                  child: Column(
                                    children: [
                                      Text(
                                        "STARTER PACK",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w800,
                                            color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "\$100",
                                        style: TextStyle(
                                            fontSize: 35,
                                            fontWeight: FontWeight.w900,
                                            color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Divider(
                                        color: Colors.black,
                                        thickness: 0,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Duration:",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            "5 Days",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Daily Profit:",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            "1.8%",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Minimum:",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            "\$100",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Maximum:",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            "\$999",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Referral:",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            "10%",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Divider(
                                        color: Colors.black,
                                        thickness: 0,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.pushAndRemoveUntil(
                                              context,
                                              CupertinoPageRoute(
                                                  builder: (context) =>
                                                      LoginPage()),
                                              (Route<dynamic> route) => false);
                                        },
                                        child: Container(
                                          height: 40,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Color.fromRGBO(
                                                  243, 156, 18, 1)),
                                          child: Center(
                                            child: Text(
                                              'Invest',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                color: Colors.white,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 20, right: 20, top: 30, bottom: 20),
                                  child: Column(
                                    children: [
                                      Text(
                                        "STANDARD PACK",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w800,
                                            color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "\$1,000",
                                        style: TextStyle(
                                            fontSize: 35,
                                            fontWeight: FontWeight.w900,
                                            color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Divider(
                                        color: Colors.black,
                                        thickness: 0,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Duration:",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            "5 Days",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Daily Profit:",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            "2.5%",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Minimum:",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            "\$1,000",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Maximum:",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            "\$4,999",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Referral:",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            "10%",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Divider(
                                        color: Colors.black,
                                        thickness: 0,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.pushAndRemoveUntil(
                                              context,
                                              CupertinoPageRoute(
                                                  builder: (context) =>
                                                      LoginPage()),
                                              (Route<dynamic> route) => false);
                                        },
                                        child: Container(
                                          height: 40,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Color.fromRGBO(
                                                  243, 156, 18, 1)),
                                          child: Center(
                                            child: Text(
                                              'Invest',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                color: Colors.white,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 20, right: 20, top: 30, bottom: 20),
                                  child: Column(
                                    children: [
                                      Text(
                                        "PREMIUM PACK",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w800,
                                            color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "\$5,000",
                                        style: TextStyle(
                                            fontSize: 35,
                                            fontWeight: FontWeight.w900,
                                            color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Divider(
                                        color: Colors.black,
                                        thickness: 0,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Duration:",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            "5 Days",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Daily Profit:",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            "3.0%",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Minimum:",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            "\$5,000",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Maximum:",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            "\$9,999",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "DReferral:",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            "10%",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Divider(
                                        color: Colors.black,
                                        thickness: 0,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.pushAndRemoveUntil(
                                              context,
                                              CupertinoPageRoute(
                                                  builder: (context) =>
                                                      LoginPage()),
                                              (Route<dynamic> route) => false);
                                        },
                                        child: Container(
                                          height: 40,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Color.fromRGBO(
                                                  243, 156, 18, 1)),
                                          child: Center(
                                            child: Text(
                                              'Invest',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                color: Colors.white,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 20, right: 20, top: 30, bottom: 20),
                                  child: Column(
                                    children: [
                                      Text(
                                        "PROFESSIONAL PACK",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w800,
                                            color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "\$10,000",
                                        style: TextStyle(
                                            fontSize: 35,
                                            fontWeight: FontWeight.w900,
                                            color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Divider(
                                        color: Colors.black,
                                        thickness: 0,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Duration:",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            "5 Days",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Daily Profit:",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            "3.5%",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Minimum:",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            "\$10,000",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Maximum:",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            "\$15,000",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Referral:",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            "10%",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Divider(
                                        color: Colors.black,
                                        thickness: 0,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.pushAndRemoveUntil(
                                              context,
                                              CupertinoPageRoute(
                                                  builder: (context) =>
                                                      LoginPage()),
                                              (Route<dynamic> route) => false);
                                        },
                                        child: Container(
                                          height: 40,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Color.fromRGBO(
                                                  243, 156, 18, 1)),
                                          child: Center(
                                            child: Text(
                                              'Invest',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Why Invest with us?",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w900,
                        color: Color.fromRGBO(28, 34, 55, 1),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      "Blockvault offers High Investment Opportunity for the common retail investors to buy crypto assets without any MIDDLEMAN.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(28, 34, 55, 1),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Tokenizing Bitcoin allows investors to Easily Transfer Ownership and do instant Settlements.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(28, 34, 55, 1),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Enjoy the benefits of Both Worlds now by investing in the Bitcoin and other crypto assets",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(28, 34, 55, 1),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "And Be a part of the Exclusive community of Crypto Enthusiasts.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(28, 34, 55, 1),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
            BottomBar()
          ],
        ),
      ),
    );
  }
}
