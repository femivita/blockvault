import 'package:blockvault_investment_flutter/controllers/auth_controller.dart';
import 'package:blockvault_investment_flutter/controllers/deposit_controller.dart';
import 'package:blockvault_investment_flutter/controllers/user_controller.dart';
import 'package:blockvault_investment_flutter/database/database.dart';
import 'package:blockvault_investment_flutter/pages/authentication/widgets/explore_drawer.dart';
import 'package:blockvault_investment_flutter/pages/authentication/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final ancestorScaffold = Scaffold.maybeOf(context);
    // 2. check if it has a drawer
    final hasDrawer = ancestorScaffold != null && ancestorScaffold.hasDrawer;

    final depositController = DepositController();
    return Scaffold(
      appBar: AppBar(
        actions: [
          GetX<UserController>(initState: (usercontroller) async {
            Get.find<UserController>().user = await DataBase().getUser();
          }, builder: (usercontroller) {
            return usercontroller.user.availableBalance != null
                ? Row(
                    children: [
                      Text(
                        "Total Balance:",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w800),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "\$${(usercontroller.user.availableBalance! + usercontroller.user.walletBalance!)}",
                        style: TextStyle(
                            color: Color.fromRGBO(243, 156, 18, 1),
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: 50,
                      )
                    ],
                  )
                : Row(
                    children: [
                      Text(
                        "Total Balance:",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w800),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "\$0",
                        style: TextStyle(
                            color: Color.fromRGBO(243, 156, 18, 1),
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: 50,
                      )
                    ],
                  );
          })
        ],
        leading: hasDrawer
            ? IconButton(
                icon: Icon(Icons.menu),
                // 4. open the drawer if we have one
                onPressed:
                    hasDrawer ? () => ancestorScaffold.openDrawer() : null,
              )
            : null,
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Column(
          children: [
            !ResponsiveWidget.isSmallScreen(context)
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 3,
                        height: 170,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(28, 34, 55, 1),
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Wallet Balance",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              GetX<UserController>(
                                  initState: (usercontroller) async {
                                Get.find<UserController>().user =
                                    await DataBase().getUser();
                              }, builder: (usercontroller) {
                                return usercontroller.user.walletBalance != null
                                    ? Text(
                                        "\$${usercontroller.user.walletBalance}",
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(243, 156, 18, 1),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w900),
                                      )
                                    : Text(
                                        "\$0",
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(243, 156, 18, 1),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w900),
                                      );
                              }),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 3,
                        height: 170,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(28, 34, 55, 1),
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Available Profit",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              GetX<UserController>(
                                  initState: (usercontroller) async {
                                Get.find<UserController>().user =
                                    await DataBase().getUser();
                              }, builder: (usercontroller) {
                                return usercontroller.user.availableBalance !=
                                        null
                                    ? Text(
                                        "\$${usercontroller.user.availableBalance}",
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(243, 156, 18, 1),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w900),
                                      )
                                    : Text(
                                        "\$0",
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(243, 156, 18, 1),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w900),
                                      );
                              }),
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
                        height: 170,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(28, 34, 55, 1),
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Wallet Balance",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              GetX<UserController>(
                                  initState: (usercontroller) async {
                                Get.find<UserController>().user =
                                    await DataBase().getUser();
                              }, builder: (usercontroller) {
                                return usercontroller.user.walletBalance != null
                                    ? Text(
                                        "\$${usercontroller.user.walletBalance}",
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(243, 156, 18, 1),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w900),
                                      )
                                    : Text(
                                        "\$0",
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(243, 156, 18, 1),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w900),
                                      );
                              }),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 170,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(28, 34, 55, 1),
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Available Profit",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              GetX<UserController>(
                                  initState: (usercontroller) async {
                                Get.find<UserController>().user =
                                    await DataBase().getUser();
                              }, builder: (usercontroller) {
                                return usercontroller.user.availableBalance !=
                                        null
                                    ? Text(
                                        "\$${usercontroller.user.availableBalance}",
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(243, 156, 18, 1),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w900),
                                      )
                                    : Text(
                                        "\$0",
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(243, 156, 18, 1),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w900),
                                      );
                              }),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
            // Row(
            //   children: [
            //     Container(
            //       width: MediaQuery.of(context).size.width / 2.7,
            //       height: 150,
            //       decoration: BoxDecoration(
            //           color: Color.fromRGBO(28, 34, 55, 1),
            //           borderRadius: BorderRadius.circular(5)),
            //       child: Padding(
            //         padding: const EdgeInsets.all(30.0),
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Text(
            //               "Available Profit",
            //               style: TextStyle(
            //                   color: Colors.white,
            //                   fontSize: 20,
            //                   fontWeight: FontWeight.w900),
            //             ),
            //             SizedBox(
            //               height: 10,
            //             ),
            //             Text(
            //               "\$0",
            //               style: TextStyle(
            //                   color: Color.fromRGBO(243, 156, 18, 1),
            //                   fontSize: 20,
            //                   fontWeight: FontWeight.w900),
            //             ),
            //           ],
            //         ),
            //       ),
            //     )
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
