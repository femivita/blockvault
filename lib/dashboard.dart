import 'package:blockvault_investment_flutter/controllers/auth_controller.dart';
import 'package:blockvault_investment_flutter/pages/Profile.dart';
import 'package:blockvault_investment_flutter/pages/deposit.dart';
import 'package:blockvault_investment_flutter/pages/home.dart';
import 'package:blockvault_investment_flutter/pages/portfolio.dart';
import 'package:blockvault_investment_flutter/pages/support.dart';
import 'package:blockvault_investment_flutter/pages/withdraw.dart';
import 'package:collapsible_sidebar/collapsible_sidebar.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:side_navigation/side_navigation.dart';
import 'package:universal_html/html.dart' as html;

final AuthController controller = Get.put(AuthController());

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final AuthController controller = Get.put(AuthController());
  PageController page = PageController();
  SideMenuController sideMenu = SideMenuController();
  @override
  void initState() {
    sideMenu.addListener((p0) {
      page.jumpToPage(p0);
    });
    super.initState();
  }

  List<CollapsibleItem> get _items {
    return [
      CollapsibleItem(
        text: 'Dashboard',
        icon: Icons.assessment,
        onPressed: () => HomePage(),
        isSelected: true,
      ),
      CollapsibleItem(
        text: 'Ice-Cream',
        icon: Icons.icecream,
        onPressed: () => DepositScreen(),
      ),
      CollapsibleItem(
        text: 'Search',
        icon: Icons.search,
        onPressed: () => WithdrawalScreen(),
        onHold: () => ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: const Text("Search"))
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SideMenu(
            controller: sideMenu,
            style: SideMenuStyle(
              // showTooltip: false,
              displayMode: SideMenuDisplayMode.auto,
              hoverColor: Colors.blue[100],
              // selectedHoverColor: Color.alphaBlend(
              //     Color.fromRGBO(
              //         Theme.of(context).colorScheme.surfaceTint.red,
              //         Theme.of(context).colorScheme.surfaceTint.green,
              //         Theme.of(context).colorScheme.surfaceTint.blue,
              //         0.08),
              //     Colors.blue[100]!),
              selectedColor: Colors.lightBlue,
              selectedTitleTextStyle: const TextStyle(color: Colors.white),
              selectedIconColor: Colors.white,
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.all(Radius.circular(10)),
              // ),
              // backgroundColor: Colors.blueGrey[700]
            ),
            title: Column(
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxHeight: 150,
                    maxWidth: 150,
                  ),
                  child: Image.asset(
                    'assets/easy_sidemenu.png',
                  ),
                ),
                const Divider(
                  indent: 8.0,
                  endIndent: 8.0,
                ),
              ],
            ),
            footer: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'mohada',
                style: TextStyle(fontSize: 15),
              ),
            ),
            items: [
              SideMenuItem(
                priority: 0,
                title: 'Dashboard',
                onTap: (page, _) {
                  sideMenu.changePage(page);
                },
                icon: const Icon(Icons.home),
              ),
              SideMenuItem(
                priority: 1,
                title: 'Deposit',
                onTap: (page, _) {
                  sideMenu.changePage(page);
                },
                icon: const Icon(Icons.wallet),
              ),
              SideMenuItem(
                priority: 2,
                title: 'Withdrawal',
                onTap: (page, _) {
                  sideMenu.changePage(page);
                },
                icon: const Icon(Icons.credit_card),
              ),
              SideMenuItem(
                priority: 3,
                title: 'Customer Support',
                onTap: (page, _) {
                  sideMenu.changePage(page);
                },
                icon: const Icon(Icons.contact_support),
              ),
              SideMenuItem(
                priority: 4,
                title: 'Account',
                onTap: (page, _) {
                  sideMenu.changePage(page);
                },
                icon: const Icon(Icons.person),
              ),
              // SideMenuItem(
              //   priority: 5,
              //   onTap:(page){
              //     sideMenu.changePage(5);
              //   },
              //   icon: const Icon(Icons.image_rounded),
              // ),
              // SideMenuItem(
              //   priority: 6,
              //   title: 'Only Title',
              //   onTap:(page){
              //     sideMenu.changePage(6);
              //   },
              // ),
              SideMenuItem(
                priority: 7,
                onTap: (page, _) {
                  controller.signOut();
                },
                title: 'Logout',
                icon: Icon(Icons.exit_to_app),
              ),
            ],
          ),
          Expanded(
            child: PageView(
              controller: page,
              children: [
                HomePage(),
                DepositScreen(),
                WithdrawalScreen(),
                SupportScreen(),
                ProfilePage()
              ],
            ),
          ),
        ],
      ),
    );
  }

  
}
