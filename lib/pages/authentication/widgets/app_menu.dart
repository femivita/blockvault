import 'package:blockvault_investment_flutter/controllers/auth_controller.dart';
import 'package:blockvault_investment_flutter/dashboard.dart';
import 'package:blockvault_investment_flutter/pages/deposit.dart';
import 'package:blockvault_investment_flutter/pages/home.dart';
import 'package:blockvault_investment_flutter/pages/invest_page.dart';
import 'package:blockvault_investment_flutter/pages/profile.dart';
import 'package:blockvault_investment_flutter/pages/support.dart';
import 'package:blockvault_investment_flutter/pages/withdraw.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

// a map of ("page name", WidgetBuilder) pairs
final _availablePages = <String, WidgetBuilder>{
  'Dashboard': (_) => HomePage(),
  'Deposit': (_) => DepositScreen(),
  'Withdrawal': (_) => WithdrawalScreen(),
  'Customer Support': (_) => SupportScreen(),
  'invest': (_) => InvestmentPage(),
  'Account': (_) => ProfilePage(),
  'Logout': (_) => Text('')
};

// make this a `StateProvider` so we can change its value
final selectedPageNameProvider = StateProvider<String>((ref) {
  // default value
  return _availablePages.keys.first;
});

final selectedPageBuilderProvider = Provider<WidgetBuilder>((ref) {
  // watch for state changes inside selectedPageNameProvider
  final selectedPageKey = ref.watch(selectedPageNameProvider.state).state;
  // return the WidgetBuilder using the key as index
  return _availablePages[selectedPageKey]!;
});

// 1. extend from ConsumerWidget
class AppMenu extends ConsumerWidget {
  void _selectPage(BuildContext context, WidgetRef ref, String pageName) {
    if (ref.read(selectedPageNameProvider.state).state != pageName) {
      ref.read(selectedPageNameProvider.state).state = pageName;
      // dismiss the drawer of the ancestor Scaffold if we have one
      if (Scaffold.maybeOf(context)?.hasDrawer ?? false) {
        Navigator.of(context).pop();
      }
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AuthController controller = Get.put(AuthController());
    // 2. watch the provider's state
    final selectedPageName = ref.watch(selectedPageNameProvider.state).state;
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
        centerTitle: false,
        backgroundColor: Color.fromRGBO(28, 34, 55, 1),
      ),
      body: ListView(
        children: <Widget>[
          for (var pageName in _availablePages.keys)
            PageListTile(
              // 3. pass the selectedPageName as an argument
              selectedPageName: selectedPageName,
              pageName: pageName,
              onPressed: () => pageName == 'Logout' ?  controller.signOut() : _selectPage(context, ref, pageName),
            ),
        ],
      ),
    );
  }
}

class PageListTile extends StatelessWidget {
  const PageListTile({
    Key? key,
    this.selectedPageName,
    required this.pageName,
    this.onPressed,
  }) : super(key: key);
  final String? selectedPageName;
  final String pageName;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      // show a check icon if the page is currently selected
      // note: we use Opacity to ensure that all tiles have a leading widget
      // and all the titles are left-aligned
      leading: Opacity(
        opacity: selectedPageName == pageName ? 1.0 : 0.0,
        child: Icon(Icons.check),
      ),
      title: Text(pageName),
      onTap: onPressed,
    );
  }
}
