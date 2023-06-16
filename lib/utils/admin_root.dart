import 'package:blockvault_investment_flutter/controllers/auth_controller.dart';
import 'package:blockvault_investment_flutter/dashboard.dart';
import 'package:blockvault_investment_flutter/pages/authentication/admin/admin_app_menu.dart';
import 'package:blockvault_investment_flutter/pages/authentication/admin/split_view_admin.dart';
import 'package:blockvault_investment_flutter/pages/authentication/landingpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class AdminMyApp extends ConsumerWidget {
  const AdminMyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 3. watch selectedPageBuilderProvider
    final selectedPageBuilder = ref.watch(adminselectedPageBuilderProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      // just return `FirstPage` for now. We'll change this later
      home: AdminSplitView(
        menu: AdminAppMenu(),
        content: selectedPageBuilder(context),
      ),
    );
  }
}
