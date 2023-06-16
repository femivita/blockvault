import 'package:blockvault_investment_flutter/controllers/auth_controller.dart';
import 'package:blockvault_investment_flutter/controllers/user_controller.dart';
import 'package:blockvault_investment_flutter/database/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final ancestorScaffold = Scaffold.maybeOf(context);
    // 2. check if it has a drawer
    final hasDrawer = ancestorScaffold != null && ancestorScaffold.hasDrawer;
    return Scaffold(
      appBar: AppBar(
        actions: [
          GetX<UserController>(
            initState: (usercontroller) async {
               Get.find<UserController>().user = await DataBase().getUser();
            },
            builder: (usercontroller) {
              return usercontroller.user.availableBalance != null ? Row(
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
              ) : Row(
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
            }
          )
        ],
        leading: hasDrawer
            ? IconButton(
                icon: Icon(Icons.menu),
                // 4. open the drawer if we have one
                onPressed:
                    hasDrawer ? () => ancestorScaffold.openDrawer() : null,
              )
            : null,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 150, right: 150),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.blue[900]),
              child: Center(
                child: Text(
                  "Change Password",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
