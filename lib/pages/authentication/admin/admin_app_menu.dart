import 'package:blockvault_investment_flutter/controllers/auth_controller.dart';
import 'package:blockvault_investment_flutter/pages/admin_pages/add_bonus.dart';
import 'package:blockvault_investment_flutter/pages/admin_pages/add_profit.dart';
import 'package:blockvault_investment_flutter/pages/admin_pages/admin_deposit.dart';
import 'package:blockvault_investment_flutter/pages/admin_pages/admin_users.dart';
import 'package:blockvault_investment_flutter/pages/admin_pages/admin_withdrawal.dart';
import 'package:blockvault_investment_flutter/pages/admin_pages/dashboard.dart';
import 'package:blockvault_investment_flutter/pages/admin_pages/fund_deposit.dart';
import 'package:blockvault_investment_flutter/pages/admin_pages/payment_method.dart';
import 'package:blockvault_investment_flutter/pages/admin_pages/reduce_fund.dart';
import 'package:blockvault_investment_flutter/pages/admin_pages/widget/approved_deposit.dart';
import 'package:blockvault_investment_flutter/pages/admin_pages/widget/approved_withdrawal.dart';
import 'package:blockvault_investment_flutter/pages/admin_pages/widget/pending_deposit.dart';
import 'package:blockvault_investment_flutter/pages/admin_pages/widget/pending_withdrawal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

// a map of ("page name", WidgetBuilder) pairs
final _availablePages = <String, WidgetBuilder>{
  'Approved Deposit': (_) => const ApproveDepositScreen(),
  'Pending Deposit': (_) => const PendingDepositScreen(),
  'Approved Withdrawal': (_) => const ApprovedWithdrawalScreen(),
  'Pending Withdrawal': (_) => const PendingWithdrawalScreen(),
  'Users': (_) => const AdminUsersScreen(),
  'Reduce Fund': (_) => const ReduceFundScreen(),
  'Add Profit': (_) => const AddProfitScreen(),
  'Payment Method': (_) => const PaymentMethodScreen(),
  'Logout': (_) => const AddProfitScreen(),
};

// make this a `StateProvider` so we can change its value
final adminselectedPageNameProvider = StateProvider<String>((ref) {
  // default value
  return _availablePages.keys.first;
});

final adminselectedPageBuilderProvider = Provider<WidgetBuilder>((ref) {
  // watch for state changes inside selectedPageNameProvider
  final selectedPageKey = ref.watch(adminselectedPageNameProvider.state).state;
  // return the WidgetBuilder using the key as index
  return _availablePages[selectedPageKey]!;
});

// 1. extend from ConsumerWidget
class AdminAppMenu extends ConsumerWidget {
  const AdminAppMenu({super.key});

  void _selectPage(BuildContext context, WidgetRef ref, String pageName) {
    if (ref.read(adminselectedPageNameProvider.state).state != pageName) {
      ref.read(adminselectedPageNameProvider.state).state = pageName;
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
    final selectedPageName =
        ref.watch(adminselectedPageNameProvider.state).state;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
        centerTitle: false,
        backgroundColor: const Color.fromRGBO(28, 34, 55, 1),
      ),
      body: ListView(
        children: <Widget>[
          for (var pageName in _availablePages.keys)
            PageListTile(
              // 3. pass the selectedPageName as an argument
              selectedPageName: selectedPageName,
              pageName: pageName,
              onPressed: () => pageName == 'Logout'
                  ? controller.signOut()
                  : _selectPage(context, ref, pageName),
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
        child: const Icon(Icons.check),
      ),
      title: Text(pageName),
      onTap: onPressed,
    );
  }
}
